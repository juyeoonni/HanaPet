package com.kopo.finalproject.config;

import com.kopo.finalproject.autotransfer.model.dto.Scheduler;
import com.kopo.finalproject.autotransfer.service.AutoTransferService;
import com.kopo.finalproject.guest.model.dto.EndMessageGuest;
import com.kopo.finalproject.guest.service.GuestService;
import com.kopo.finalproject.naverSMS.SMSService;
import com.kopo.finalproject.savingaccount.model.dto.Savingaccount;
import com.kopo.finalproject.savingaccount.service.SavingaccountService;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Component
public class SchedulerConfig implements SchedulingConfigurer {
    private final AutoTransferService autoTransferService;
    private final SavingaccountService savingaccountService;
    private final GuestService guestService;
    private final SMSService smsService;

    public SchedulerConfig(AutoTransferService autoTransferService, SavingaccountService savingaccountService, GuestService guestService, SMSService smsService) {
        this.autoTransferService = autoTransferService;
        this.savingaccountService = savingaccountService;
        this.guestService = guestService;
        this.smsService = smsService;
    }

    @Override
    public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {

        // 적금 자동이체 날에 매주, 매달 나눠서 자동으로 이체 로직
        List<Scheduler> scheduleList = autoTransferService.getSchedulerInfo();
        for (Scheduler schedule : scheduleList) {
            taskRegistrar.addTriggerTask(() -> processRepayment(), triggerContext -> {
                Calendar nextExecutionTime = Calendar.getInstance();
                Date lastActualExecutionTime = triggerContext.lastActualExecutionTime();

                if (lastActualExecutionTime == null) {
                    lastActualExecutionTime = new Date();
                }

                nextExecutionTime.setTime(lastActualExecutionTime);

                int currentDay = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
                String joinDateStr = schedule.getJoinDate(); // 스케줄의 날짜 문자열
                int dayOfMonth = Integer.parseInt(joinDateStr.split("-")[2].split(" ")[0]);
                System.out.println("스케줄 날짜: " + dayOfMonth);

                if (schedule.getTransferPeriod().equals("매월")) {
                    if (dayOfMonth == currentDay) {
                        autoTransferService.autoTransfer(schedule);
                        nextExecutionTime.add(Calendar.MONTH, 1);
                        nextExecutionTime.set(Calendar.DAY_OF_MONTH, dayOfMonth);
                    } else if (dayOfMonth > currentDay) {
                        nextExecutionTime.set(Calendar.DAY_OF_MONTH, dayOfMonth);
                    } else {
                        nextExecutionTime.add(Calendar.MONTH, 1); // Next month
                        nextExecutionTime.set(Calendar.DAY_OF_MONTH, dayOfMonth);
                    }
                } else if (schedule.getTransferPeriod().equals("매주")) {
                    System.out.println("매주 들어옴");
                    joinDateStr = schedule.getJoinDate(); // 스케줄의 날짜 문자열
                    Date joinDate = null;
                    try {
                        joinDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(joinDateStr);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }

                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(joinDate);
                    int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
                    System.out.println("스케줄 요일: " + dayOfWeek);
                    //(값 1): 일요일
                    //(값 2): 월요일
                    //(값 7): 토요일

                    // 오늘 요일
                    currentDay = Calendar.getInstance().get(Calendar.DAY_OF_WEEK);
                    if (dayOfWeek == currentDay) {
                        System.out.println("Processing repayment for loan record ID: " + schedule.getGuestId());
                        autoTransferService.autoTransfer(schedule);
                        nextExecutionTime.add(Calendar.DATE, 7);
                        nextExecutionTime.set(Calendar.DAY_OF_WEEK, dayOfWeek);
                    } else if (dayOfWeek > currentDay) {
                        nextExecutionTime.set(Calendar.DAY_OF_WEEK, dayOfWeek);
                    } else {
                        nextExecutionTime.add(Calendar.DATE, 7); // Next month
                        nextExecutionTime.set(Calendar.DAY_OF_WEEK, dayOfWeek);
                    }
                }

                Instant nextInstant = nextExecutionTime.getTime().toInstant();
                System.out.println("Next scheduled time: " + nextInstant);

                return Date.from(nextInstant);
            });
        }

        // 만기일이 일주일 남은 적금의 참여자 중 문자 동의한 사람에게 문자 보내기 로직
        List<Savingaccount> savingaccountList = savingaccountService.getAllSavingAccounts();
        for (Savingaccount savingaccount : savingaccountList) {
            // 적금 상품 돌면서, enddate가 지금인걸 찾아, 그거의 opener를 가져와서 돈을 넣어줘
            taskRegistrar.addTriggerTask(() -> processRepayment(), triggerContext -> {

                // 적금 상품을 돌면서, enddate가 일주일 후인걸 찾아, 일주일 후라면, 참여자 중 sms가 Y인걸 가져와서, 그 사람한테 문자를 보내
                String endDateStr = savingaccount.getEnd_date(); // 만기일 문자열로 가져옴
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                // 현재 날짜
                Date currentDate = new Date();

                // 7일 후 날짜 계산
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(currentDate);
                calendar.add(Calendar.DAY_OF_MONTH, 7);
                Date currentDatePlus7Days = calendar.getTime();

                // 만기일을 Date 객체로 파싱
                Date endDate = null;
                try {
                    endDate = sdf.parse(endDateStr);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }

                // 현재 날짜와 7일 후 날짜가 만기일과 같은지 확인
                boolean isSameDate = sdf.format(currentDatePlus7Days).equals(sdf.format(endDate));

                if (isSameDate) {
                    // 만기 일주일 전이면 참여자 중 sms가 Y인 사람의 정보들 (사람 이름, 전화번호, 적금 이름 가져옴), 문자 보내기
                    List<EndMessageGuest> endMessageGuestList = guestService.getEndMessageGuest(savingaccount.getAccount_number());
                    for (EndMessageGuest endMessageGuest : endMessageGuestList) {
                        String content = "[HanaPet] " + endMessageGuest.getName() + "님 '" + endMessageGuest.getSavingName() + "' 적금 만기일이 7일 남았습니다.";
//                        try {
//                            smsService.sendSms(endMessageGuest.getPhone(), content); // 돈 나가서 임시로 막아놓음
//                        } catch (JsonProcessingException e) {
//                            throw new RuntimeException(e);
//                        } catch (UnsupportedEncodingException e) {
//                            throw new RuntimeException(e);
//                        } catch (NoSuchAlgorithmException e) {
//                            throw new RuntimeException(e);
//                        } catch (InvalidKeyException e) {
//                            throw new RuntimeException(e);
//                        } catch (URISyntaxException e) {
//                            throw new RuntimeException(e);
//                        }
                        System.out.println("테스트: " + content);
                    }
                }
                return null;
            });
        }
    }

    public void processRepayment() {
    }
}
