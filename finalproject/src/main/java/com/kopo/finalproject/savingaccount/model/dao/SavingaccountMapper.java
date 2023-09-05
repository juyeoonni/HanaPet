package com.kopo.finalproject.savingaccount.model.dao;

import com.kopo.finalproject.savingaccount.model.dto.Savingaccount;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface SavingaccountMapper {
    List<Savingaccount> getAllSavingAccountsOfPetOfGuest(HashMap<String,String> data);
    void createSavingAccounts(HashMap<String, String> data);
}
