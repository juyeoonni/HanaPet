package com.kopo.finalproject.insurance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class InsuranceServiceImpl implements InsuranceService {
    private final InsuranceMapper insuranceMapper;

    @Autowired
    public InsuranceServiceImpl(InsuranceMapper insuranceMapper) {
        this.insuranceMapper = insuranceMapper;
    }

    @Override

    public List<BreedData> getBreedData(String breed) {
        return insuranceMapper.getBreedData(breed);
    }

    @Override
    public List<MyInsurance> getAllInsurancesOfPetOfGuest(HashMap<String, String> data) {
        return insuranceMapper.getAllInsurancesOfPetOfGuest(data);
    }

    @Override
    public void joinInsurance(HashMap<String, String> data) {
        insuranceMapper.joinInsurance(data);
    }
}
