package com.kopo.finalproject.admin;


import com.kopo.finalproject.admin.dto.*;

import java.util.List;

public interface AdminService {

    // 총 손님 수
    public Integer getGuestCnt();

    // 총 반려견 수
    public Integer getPetCnt();

    // 반려견 나이 별 수와 비율
    public List<AdminPetAge> getPetAgeCnt();

    // 반려견 품종 별 수와 비율
    public List<AdminPetBreed> getPetBreedCnt();

    // 반려견 성별 별 수와 비율
    public List<AdminPetGender> getPetGenderCnt();

    // 손님의 매달 가입자 수
    public List<AdminGuestMonthly> getGuestJoinCnt();

    // 적금 상품 별 계좌 수와 비율, 가입자 수와 비율
    public List<AdminSaving> getSavingCnt();

    // 보험 상품 별 가입자 수와 비율
    public List<AdminInsurance> getInsuranceCnt();
}
