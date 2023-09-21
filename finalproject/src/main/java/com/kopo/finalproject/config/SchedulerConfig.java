package com.kopo.finalproject.config;

import com.kopo.finalproject.autotransfer.model.dto.Scheduler;
import com.kopo.finalproject.autotransfer.service.AutoTransferService;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private final AutoTransferService autoTransferService;

    public SchedulerConfig(AutoTransferService autoTransferService) {
        this.autoTransferService = autoTransferService;
    }

    @Override
    public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
        List<Scheduler> scheduleList = autoTransferService.getSchedulerInfo();
        System.out.println("scheduleList " + scheduleList);

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
    }

    public void processRepayment() {
    }
}
