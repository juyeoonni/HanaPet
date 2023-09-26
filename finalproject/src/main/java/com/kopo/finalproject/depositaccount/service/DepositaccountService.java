package com.kopo.finalproject.depositaccount.service;

import com.kopo.finalproject.depositaccount.model.dto.Depositaccount;
import com.kopo.finalproject.depositaccount.model.dto.History;

import java.util.HashMap;
import java.util.List;

public interface DepositaccountService {

    // opener_id(손님)의 pet_id(펫)이 가진 예금을 모두 가져오기
    List<Depositaccount> getAllDepositAccountsOfGuest(String guest_id);

    // 예금 거래내역 가져오기
    List<History> getHistory(String account_number);

    int checkDepositAccountPW(HashMap<String, String> checkPWdata);
}
