package com.kopo.finalproject.pet.service;

import com.kopo.finalproject.pet.model.dao.PetMapper;
import com.kopo.finalproject.pet.model.dto.Pet;
import com.kopo.finalproject.product.model.dao.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PetServiceImpl implements PetService {
    private final PetMapper petMapper;

    @Autowired
    public PetServiceImpl(PetMapper petMapper) {
        this.petMapper = petMapper;
    }

    @Override
    public List<Pet> getAllPetsOfGuest(String guest_id) {
        return petMapper.getAllPetsOfGuest(guest_id);
    }
}
