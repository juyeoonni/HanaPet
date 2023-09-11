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
}
