package com.kopo.finalproject.autotransfer.service;

import com.kopo.finalproject.autotransfer.model.dao.AutoTransferMapper;
import com.kopo.finalproject.autotransfer.model.dto.EndTransferInfo;
import com.kopo.finalproject.autotransfer.model.dto.Scheduler;
import com.kopo.finalproject.depositaccount.model.dao.DepositaccountMapper;
import com.kopo.finalproject.guest.model.dao.GuestMapper;
import com.kopo.finalproject.joinsaving.model.dao.JoinSavingMapper;
import com.kopo.finalproject.naverSMS.SMSService;
import com.kopo.finalproject.savingaccount.model.dao.SavingaccountMapper;
import com.kopo.finalproject.transferhistory.model.dao.TransferHistoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Service
@EnableScheduling
public class AutoTransferServiceImpl implements AutoTransferService {

    private final AutoTransferMapper autoTransferMapper;
    private final DepositaccountMapper depositaccountMapper;
    private final SavingaccountMapper savingaccountMapper;
    private final TransferHistoryMapper transferHistoryMapper;
    private final JoinSavingMapper joinSavingMapper;
    private final GuestMapper guestMapper;


    private HashMap<String, String> data = new HashMap<>();

    private final SMSService smsService;

    @Autowired
    public AutoTransferServiceImpl(AutoTransferMapper autoTransferMapper, DepositaccountMapper depositaccountMapper, SavingaccountMapper savingaccountMapper, TransferHistoryMapper transferHistoryMapper, JoinSavingMapper joinSavingMapper, GuestMapper guestMapper, SMSService smsService) {
        this.autoTransferMapper = autoTransferMapper;
        this.depositaccountMapper = depositaccountMapper;
        this.savingaccountMapper = savingaccountMapper;
        this.transferHistoryMapper = transferHistoryMapper;
        this.joinSavingMapper = joinSavingMapper;
        this.guestMapper = guestMapper;
        this.smsService = smsService;
    }

    @Override
    public List<Scheduler> getSchedulerInfo() {
        return autoTransferMapper.getSchedulerInfo();
    }

    @Override
    public List<EndTransferInfo> getEndTransferInfo(String account_number) {
        return autoTransferMapper.getEndTransferInfo(account_number);
    }

    @Override
    @Transactional
    public void autoTransfer(String amount, String dan, String an, String gid, String dateString) {
        try {
            data.put("amount", amount);
            data.put("deposit_account_number", dan);
            data.put("account_number", an);
            data.put("guest_id", gid);
            data.put("date", dateString);

            // 1. 예금 계좌 테이블 수정 (update) - 돈 빠져나가기
            depositaccountMapper.withdraw(data);

            // 2. 적금 참여 테이블 기여도 금액 수정
            joinSavingMapper.updateContributionAmount(data);

            // 3. 적금 계좌 테이블 수정 (update) - (현재 금액) 돈 들어오기
            savingaccountMapper.autoDeposit(data);

            // 적금 계좌 잔액 가져오기 (이체 내역 insert를 위한)
            String balance = savingaccountMapper.getBalance(data.get("account_number"));
            data.put("current_balance_s", balance);

            // 예금 계좌 잔액 가져오기 (이체 내역 insert를 위한)
            balance = depositaccountMapper.getBalance(data.get("deposit_account_number"));
            data.put("current_balance_d", balance);

            // 4. 이체 내역 테이블 생성 (insert) - 내역 기록
            transferHistoryMapper.insertHistory(data);
            transferHistoryMapper.insertDepositHistory(data);

            // 문자 보내기
//            String content = "[HanaPet] 출금계좌 " + schedule.getDepositAccountNumber() + ' ' + schedule.getTransferAmount() + "원 자동이체 완료.";
//            smsService.sendSms(guestMapper.getPhone(schedule.getGuestId()), content); // 돈 나가서 임시로 막아놓음

        } catch (Exception e) {
            throw new RuntimeException("자동이체 작업 중 오류 발생: " + e.getMessage());
        }
    }

    // 자동이체 실행
    @Override
    @Transactional
    public void autoTransfer(Scheduler schedule) {
        try {
            data.put("amount", schedule.getTransferAmount());
            data.put("deposit_account_number", schedule.getDepositAccountNumber());
            data.put("account_number", schedule.getAccountNumber());
            data.put("guest_id", schedule.getGuestId());

            // 1. 예금 계좌 테이블 수정 (update) - 돈 빠져나가기
            depositaccountMapper.withdraw(data);

            // 2. 적금 참여 테이블 기여도 금액 수정
            joinSavingMapper.updateContributionAmount(data);

            // 3. 적금 계좌 테이블 수정 (update) - (현재 금액) 돈 들어오기
            savingaccountMapper.autoDeposit(data);

            // 적금 계좌 잔액 가져오기 (이체 내역 insert를 위한)
            String balance = savingaccountMapper.getBalance(data.get("account_number"));
            data.put("current_balance_s", balance);

            // 예금 계좌 잔액 가져오기 (이체 내역 insert를 위한)
            balance = depositaccountMapper.getBalance(data.get("deposit_account_number"));
            data.put("current_balance_d", balance);

            // 4. 이체 내역 테이블 생성 (insert) - 내역 기록
            transferHistoryMapper.insertHistory(data);
            transferHistoryMapper.insertDepositHistory(data);

            // 문자 보내기
//            String content = "[HanaPet] 출금계좌 " + schedule.getDepositAccountNumber() + ' ' + schedule.getTransferAmount() + "원 자동이체 완료.";
//            smsService.sendSms(guestMapper.getPhone(schedule.getGuestId()), content); // 돈 나가서 임시로 막아놓음

        } catch (Exception e) {
            throw new RuntimeException("자동이체 작업 중 오류 발생: " + e.getMessage());
        }
    }

    @Override
    @Transactional
    public void endTransfer(EndTransferInfo endTransferInfo) {
        try {
            data.put("real_amount", Integer.toString((Integer.parseInt(endTransferInfo.getFinalAmount()) + Integer.parseInt(endTransferInfo.getInterestAmount()))));
            data.put("amount", Integer.toString((int) (Integer.parseInt(endTransferInfo.getFinalAmount()) + Integer.parseInt(endTransferInfo.getInterestAmount()) * 0.846)));
            data.put("deposit_account_number", endTransferInfo.getDepositAccountNumber());
            data.put("account_number", endTransferInfo.getAccountNumber());
            data.put("guest_id", endTransferInfo.getGuestId());

            // 1. 예금 계좌 테이블 수정 (update) - 돈 넣기 (평소랑 반대)
            depositaccountMapper.insert(data);

            // 3. 적금 계좌 테이블 수정 (update) - (현재 금액) 돈 빠져나가기 0원 됨
            savingaccountMapper.autoWithdraw(data);

            // 적금 계좌 잔액 0원 (이체 내역 insert를 위한)
            data.put("current_balance_s", "0");

            // 예금 계좌 잔액 가져오기 (이체 내역 insert를 위한)
            String balance = depositaccountMapper.getBalance(data.get("deposit_account_number"));
            data.put("current_balance_d", balance);

            // 4. 이체 내역 테이블 생성 (insert) - 내역 기록
            transferHistoryMapper.insertDepositHistoryEnd(data);

        } catch (Exception e) {
            throw new RuntimeException("만료 이체 작업 중 오류 발생: " + e.getMessage());
        }
    }
}
