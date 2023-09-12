package com.kopo.finalproject.savingaccount.service;

import com.kopo.finalproject.autotransfer.model.dao.AutoTransferMapper;
import com.kopo.finalproject.depositaccount.model.dao.DepositaccountMapper;
import com.kopo.finalproject.joinsaving.model.dao.JoinSavingMapper;
import com.kopo.finalproject.savingaccount.model.dao.SavingaccountMapper;
import com.kopo.finalproject.savingaccount.model.dto.Savingaccount;
import com.kopo.finalproject.transferhistory.model.dao.TransferHistoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Service
public class SavingaccountServiceImpl implements SavingaccountService {
    private final SavingaccountMapper savingaccountMapper;
    private final AutoTransferMapper autoTransferMapper;
    private final DepositaccountMapper depositaccountMapper;

    private final TransferHistoryMapper transferHistoryMapper;

    private final JoinSavingMapper joinSavingMapper;

    @Autowired
    public SavingaccountServiceImpl(SavingaccountMapper savingaccountMapper, AutoTransferMapper autoTransferMapper, DepositaccountMapper depositaccountMapper, TransferHistoryMapper transferHistoryMapper, JoinSavingMapper joinSavingMapper) {
        this.savingaccountMapper = savingaccountMapper;
        this.autoTransferMapper = autoTransferMapper;
        this.depositaccountMapper = depositaccountMapper;
        this.transferHistoryMapper = transferHistoryMapper;
        this.joinSavingMapper = joinSavingMapper;
    }

    @Override
    public List<Savingaccount> getAllSavingAccountsOfPetOfGuest(HashMap<String, String> data) {
        return savingaccountMapper.getAllSavingAccountsOfPetOfGuest(data);
    }

    @Override
    @Transactional
    public void joinSavingAccounts(HashMap<String, String> data) {
        try {
            // 1. 적금 계좌 테이블 생성 (insert)
            savingaccountMapper.createSavingAccounts(data);
            // 2. 적금 참여 테이블 생성 (insert)
            joinSavingMapper.joinSaving(data);
            // 3. 자동이체 테이블 생성 (insert)
            autoTransferMapper.insertAutoTransfer(data);
            // 4. 예금 계좌 테이블 수정 (update) - 돈 빠져나가기
            depositaccountMapper.withdraw(data);
            // 5. 적금 계좌 테이블 수정 (update) - (현재 금액) 돈 들어오기, (진행률) 증가
            savingaccountMapper.deposit(data);

            // 자동이체 ID 가져오기 (이체 내역 insert를 위한)
            String transferId = autoTransferMapper.getTransferId(data);
            data.put("transferId", transferId);

            // 적금 계좌 잔액 가져오기 (이체 내역 insert를 위한)
            String balance = savingaccountMapper.getBalance(data.get("account_number"));
            data.put("current_balance", balance);

            // 이체 내역에 회차 가져오기 (이체 내역 insert를 위한)
            String no = transferHistoryMapper.getTransferNo(data.get("transferId"));
            int num = no == null ? 0 : Integer.parseInt(no);
            String transferNo = String.valueOf(num + 1);
            data.put("transferNo", transferNo);

            // 6. 이체 내역 테이블 생성 (insert) - 내역 기록
            transferHistoryMapper.insertTransferHistory(data);

        } catch (Exception e) {
            throw new RuntimeException("joinSavingAccounts 작업 중 오류 발생: " + e.getMessage());
        }

    }

    @Override
    @Transactional
    public void joinInvited(HashMap<String, String> data) {
        try {
            // 1. 적금 참여 테이블 수정 (update) - 수락여부 변경, 참여일, sms 등록 2개
            joinSavingMapper.updateInvited(data);

//            // 2. 자동이체 테이블 생성 (insert) - 모든 데이터
//            autoTransferMapper.insertAutoTransfer(data);
//
//            // 3. 예금 계좌 테이블 수정 (update) - 돈 빠져나가기
//            depositaccountMapper.withdraw(data);
//
//            // 4. 적금 계좌 테이블 수정 (update) - (현재 금액) 돈 들어오기 , 알아서 진행률 변경됨
//            savingaccountMapper.deposit(data);
//
//            // 자동이체 ID 가져오기 (이체 내역 insert를 위한)
//            String transferId = autoTransferMapper.getTransferId(data);
//            data.put("transferId", transferId);
//
//            // 적금 계좌 잔액 가져오기 (이체 내역 insert를 위한)
//            String balance = savingaccountMapper.getBalance(data.get("account_number"));
//            data.put("current_balance", balance);
//
//            // 이체 내역에 회차 가져오기 (이체 내역 insert를 위한)
//            String no = transferHistoryMapper.getTransferNo(data.get("transferId"));
//            int num = no == null ? 0 : Integer.parseInt(no);
//            String transferNo = String.valueOf(num + 1);
//            data.put("transferNo", transferNo);
//
//            // 한번에 자동이체, 적금계좌 잔액, 이체 내역 회차 가져오기
//
//            // 6. 이체 내역 테이블 생성 (insert) - 내역 기록
//            transferHistoryMapper.insertTransferHistory(data);
//
//            // 7. 이체 됐으니 적금 참여 테이블 기여도, 기여금액 바꾸기
////            joinSavingMapper.updateContribution(data);


        } catch (Exception e) {
            throw new RuntimeException("joinSavingAccounts 작업 중 오류 발생: " + e.getMessage());
        }
    }

}
