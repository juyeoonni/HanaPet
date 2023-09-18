package com.kopo.finalproject.savingaccount.service;

import com.kopo.finalproject.depositaccount.model.dao.DepositaccountMapper;
import com.kopo.finalproject.guest.model.dao.GuestMapper;
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
    private final DepositaccountMapper depositaccountMapper;
    private final TransferHistoryMapper transferHistoryMapper;
    private final JoinSavingMapper joinSavingMapper;
    private final GuestMapper guestMapper;


    @Autowired
    public SavingaccountServiceImpl(SavingaccountMapper savingaccountMapper, DepositaccountMapper depositaccountMapper, TransferHistoryMapper transferHistoryMapper, JoinSavingMapper joinSavingMapper, GuestMapper guestMapper) {
        this.savingaccountMapper = savingaccountMapper;
        this.depositaccountMapper = depositaccountMapper;
        this.transferHistoryMapper = transferHistoryMapper;
        this.joinSavingMapper = joinSavingMapper;
        this.guestMapper = guestMapper;
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
            // 3. 예금 계좌 테이블 수정 (update) - 돈 빠져나가기
            depositaccountMapper.withdraw(data);
            // 4. 적금 계좌 테이블 수정 (update) - (현재 금액) 돈 들어오기, (진행률) 증가
            savingaccountMapper.deposit(data);

            // 적금 계좌 잔액 가져오기 (이체 내역 insert를 위한)
            String balance = savingaccountMapper.getBalance(data.get("account_number"));
            data.put("current_balance_s", balance);

            //예금 계좌 잔액 가져오기 (이체 내역 insert를 위한)
            balance = depositaccountMapper.getBalance(data.get("deposit_account_number"));
            data.put("current_balance_d", balance);

            // 5. 이체 내역 테이블 생성 (insert) - 내역 기록
            transferHistoryMapper.insertHistory(data);

        } catch (Exception e) {
            throw new RuntimeException("joinSavingAccounts 작업 중 오류 발생: " + e.getMessage());
        }
    }

    @Override
    @Transactional
    public void joinInvited(HashMap<String, String> data) {
        try {
            // 1. 적금 참여 테이블 생성 -> 기여도는 트리거로 자동 업데이트됨
            joinSavingMapper.joinSaving(data);
            // 2. 예금 계좌 테이블 수정 (update) - 돈 빠져나가기
            depositaccountMapper.withdraw(data);
            // 3. 적금 계좌 테이블 수정 (update) - (현재 금액) 돈 들어오기 , 알아서 진행률 변경됨, finalAmount랑 interestAmount 바꾸기
            System.out.println("유ㅣㄻ"+ data.get("final_amount"));
            savingaccountMapper.deposit(data);

            // 적금 계좌 잔액 가져오기 (이체 내역 insert를 위한)
            String balance = savingaccountMapper.getBalance(data.get("account_number"));
            data.put("current_balance_s", balance);
            //예금 계좌 잔액 가져오기 (이체 내역 insert를 위한)
            balance = depositaccountMapper.getBalance(data.get("deposit_account_number"));
            data.put("current_balance_d", balance);
            // 4. 이체 내역 테이블 생성 (insert) - 내역 기록
            transferHistoryMapper.insertHistory(data);
            // 5. 손님-반려견 테이블 생성 (insert)
            guestMapper.insertPet(data);

        } catch (Exception e) {
            throw new RuntimeException("joinSavingAccounts 작업 중 오류 발생: " + e.getMessage());
        }
    }

}
