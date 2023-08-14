package com.kopo.finalproject.pet.service;

import com.kopo.finalproject.pet.model.dto.Pet;

import java.util.List;

public interface PetService {

    // guest가 키우는 펫 모두 불러오기
    List<Pet> getAllPetsOfGuest(String guest_id);

}
