package com.kopo.finalproject.depositaccount.model.dao;

import com.kopo.finalproject.depositaccount.model.dto.Depositaccount;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface DepositaccountMapper {

    // 예금 계좌를 모두 가져오기 (select)
    List<Depositaccount> getAllDepositAccountsOfGuest(String guest_id);

    // 예금 계좌 비밀번호 확인하기
    int checkDepositAccountPW(HashMap<String, String> checkPWdata);

    // 예금 계좌에서 인출하기 (update)
    void withdraw(HashMap<String, String> data);
}
