package com.kopo.finalproject.savingaccount.service;

import com.kopo.finalproject.savingaccount.model.dao.SavingaccountMapper;
import com.kopo.finalproject.savingaccount.model.dto.Savingaccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public void createSavingAccounts(HashMap<String, String> data) {
        savingaccountMapper.createSavingAccounts(data);
    }
}
