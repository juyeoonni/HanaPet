package com.kopo.finalproject.savingaccount.service;

import com.kopo.finalproject.savingaccount.model.dto.MyAccountsOfPet;
import com.kopo.finalproject.savingaccount.model.dto.MyPageDetailInfo;
import com.kopo.finalproject.savingaccount.model.dto.MyPageHistoryInfo;

import java.util.HashMap;
import java.util.List;

public interface SavingaccountService {

    // opener_id(손님)의 pet_id(펫)이 가진 적금을 모두 가져오기
    List<MyAccountsOfPet> getAllSavingAccountsOfPetOfGuest(HashMap<String, String> data);

    // 적금 생성 플로우
    void joinSavingAccounts(HashMap<String, String> data);

    List<MyPageDetailInfo> getDetailInfo(String accountNumber);


    List<MyPageHistoryInfo> getHistoryInfo(String accountNumber);

    void joinInvited(HashMap<String, String> data);
}
