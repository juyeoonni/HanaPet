package com.kopo.finalproject.pet.model.dao;

import com.kopo.finalproject.pet.model.dto.Pet;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PetMapper {

    // 손님이 가진 반려견 가져오기 select
    List<Pet> getAllPetsOfGuest(String guest_id);
}
