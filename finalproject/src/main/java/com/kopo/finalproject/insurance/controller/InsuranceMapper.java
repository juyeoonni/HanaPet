package com.kopo.finalproject.insurance.controller;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InsuranceMapper {
    List<BreedData> getBreedData(String breed);
}
