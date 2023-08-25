package com.kopo.finalproject.depositaccount.model.dao;

import com.kopo.finalproject.depositaccount.model.dto.Depositaccount;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface DepositaccountMapper {
    List<Depositaccount> getAllDepositAccountsOfGuest(String guest_id);

    int checkDepositAccountPW(HashMap<String, String> checkPWdata);
}
