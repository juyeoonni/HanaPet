package com.kopo.finalproject.insurance.controller;

import java.util.HashMap;
import java.util.List;

public interface InsuranceService {

    BreedData getBreedOne(String breed);

    List<BreedRatio> getBreedRatio();

    List<AgeTopThree> getAgeTopThree();

    // 손님의 pet_id(펫)이 가진 보험을 모두 가져오기
    List<MyInsurance> getAllInsurancesOfPetOfGuest(HashMap<String, String> data);

    void joinInsurance(HashMap<String, String> data);

    MyInsurance getInsuDeatil(String insu_id);
}
