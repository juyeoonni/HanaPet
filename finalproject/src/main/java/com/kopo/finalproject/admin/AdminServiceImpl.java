package com.kopo.finalproject.admin;

import com.kopo.finalproject.admin.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    private final AdminMapper adminMapper;

    @Autowired
    public AdminServiceImpl(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @Override
    public Integer getPetCnt() {
        return adminMapper.getPetCnt();
    }

    @Override
    public List<AdminPetAge> getPetAgeCnt() {
        return adminMapper.getPetAgeCnt();
    }

    @Override
    public List<AdminPetBreed> getPetBreedCnt() {
        return adminMapper.getPetBreedCnt();
    }

    @Override
    public List<AdminPetGender> getPetGenderCnt() {
        return adminMapper.getPetGenderCnt();
    }

    @Override
    public List<AdminGuestMonthly> getGuestJoinCnt() {
        return adminMapper.getGuestJoinCnt();
    }

    @Override
    public List<AdminSaving> getSavingCnt() {
        return adminMapper.getSavingCnt();
    }

    @Override
    public List<AdminInsurance> getInsuranceCnt() {
        return adminMapper.getInsuranceCnt();
    }
}
