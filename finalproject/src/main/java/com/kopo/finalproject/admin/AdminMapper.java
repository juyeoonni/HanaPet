package com.kopo.finalproject.admin;

import com.kopo.finalproject.admin.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {

    Integer getGuestCnt();

    Integer getPetCnt();

    List<AdminPetAge> getPetAgeCnt();

    List<AdminPetBreed> getPetBreedCnt();

    List<AdminPetGender> getPetGenderCnt();

    List<AdminGuestMonthly> getGuestJoinCnt();

    List<AdminSaving> getSavingCnt();

    List<AdminInsurance> getInsuranceCnt();

}
