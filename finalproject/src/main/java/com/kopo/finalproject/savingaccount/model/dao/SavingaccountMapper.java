package com.kopo.finalproject.savingaccount.model.dao;

import com.kopo.finalproject.savingaccount.model.dto.MyAccountsOfPet;
import com.kopo.finalproject.savingaccount.model.dto.MyPageDetailInfo;
import com.kopo.finalproject.savingaccount.model.dto.MyPageHistoryInfo;
import com.kopo.finalproject.savingaccount.model.dto.Savingaccount;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface SavingaccountMapper {
    List<MyAccountsOfPet> getAllSavingAccountsOfPetOfGuest(HashMap<String, String> data);

    List<Savingaccount> getAllSavingAccounts();

    void createSavingAccounts(HashMap<String, String> data);


    void deposit(HashMap<String, String> data);

    void autoDeposit(HashMap<String, String> data);

    // 만기 시 돈 자동 출금
    void autoWithdraw(HashMap<String, String> data);

    String getBalance(String accountNumber);

    List<MyPageDetailInfo> getDetailInfo(String accountNumber);

    List<MyPageHistoryInfo> getHistoryInfo(String accountNumber);


}