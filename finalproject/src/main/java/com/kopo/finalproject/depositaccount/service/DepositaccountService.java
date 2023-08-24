package com.kopo.finalproject.depositaccount.service;

import com.kopo.finalproject.depositaccount.model.dto.Depositaccount;

import java.util.List;

public interface DepositaccountService {

    // opener_id(손님)의 pet_id(펫)이 가진 적금을 모두 가져오기
    List<Depositaccount> getAllDepositAccountsOfGuest(String guest_id);
}
