package com.kopo.finalproject.insurance.controller;

import com.kopo.finalproject.savingaccount.model.dto.MyAccountsOfPet;

import java.util.HashMap;
import java.util.List;

public interface InsuranceService {

    List<BreedData> getBreedData(String breed);

    // 손님의 pet_id(펫)이 가진 보험을 모두 가져오기
    List<MyInsurance> getAllInsurancesOfPetOfGuest(HashMap<String, String> data);

}
