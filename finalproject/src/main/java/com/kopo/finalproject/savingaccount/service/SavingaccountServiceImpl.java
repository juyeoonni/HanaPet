package com.kopo.finalproject.savingaccount.service;

import com.kopo.finalproject.savingaccount.model.dao.SavingaccountMapper;
import com.kopo.finalproject.savingaccount.model.dto.Savingaccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Service
public class SavingaccountServiceImpl implements SavingaccountService {
    private final SavingaccountMapper savingaccountMapper;

    @Autowired
    public SavingaccountServiceImpl(SavingaccountMapper savingaccountMapper) {
        this.savingaccountMapper = savingaccountMapper;
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
            savingaccountMapper.joinSaving(data);
//            // 3. 자동이체 테이블 생성 (insert)
//            savingaccountMapper.insertAutoTransfer(data);
//            // 4. 예금 계좌 테이블 수정 (update) - 돈 빠져나가기
//            savingaccountMapper.withdraw(data);
//            // 5. 적금 계좌 테이블 수정 (update) - (현재 금액) 돈 들어오기, (진행률) 증가
//            savingaccountMapper.deposit(data);
//            // 6. 이체 내역 테이블 생성 (insert) - 내역 기록
//            savingaccountMapper.insertTransferHistory(data);
//            // 7. 적금 참여 테이블 수정 (update) - 기여금액, 기여도 증가
//            savingaccountMapper.updateContribute(data);

        } catch (Exception e) {
            throw new RuntimeException("joinSavingAccounts 작업 중 오류 발생: " + e.getMessage());
        }

    }
}
