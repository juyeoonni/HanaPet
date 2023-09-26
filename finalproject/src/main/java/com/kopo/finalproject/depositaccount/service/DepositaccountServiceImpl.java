package com.kopo.finalproject.depositaccount.service;

import com.kopo.finalproject.depositaccount.model.dao.DepositaccountMapper;
import com.kopo.finalproject.depositaccount.model.dto.Depositaccount;
import com.kopo.finalproject.depositaccount.model.dto.History;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class DepositaccountServiceImpl implements DepositaccountService {
    private final DepositaccountMapper depositaccountMapper;

    @Autowired
    public DepositaccountServiceImpl(DepositaccountMapper depositaccountMapper) {
        this.depositaccountMapper = depositaccountMapper;
    }

    @Override
    public List<Depositaccount> getAllDepositAccountsOfGuest(String guest_id) {
        return depositaccountMapper.getAllDepositAccountsOfGuest(guest_id);
    }

    @Override
    public List<History> getHistory(String account_number) {
        return depositaccountMapper.getHistory(account_number);
    }

    @Override
    public int checkDepositAccountPW(HashMap<String, String> checkPWdata) {
        return depositaccountMapper.checkDepositAccountPW(checkPWdata);
    }
}
