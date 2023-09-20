package com.kopo.finalproject.insurance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
