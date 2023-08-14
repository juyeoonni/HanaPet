package com.kopo.finalproject.pet.model.dao;

import com.kopo.finalproject.pet.model.dto.Pet;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PetMapper {
    List<Pet> getAllPetsOfGuest(String guest_id);
}
