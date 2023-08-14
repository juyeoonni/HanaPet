package com.kopo.finalproject.pet.controller;

import com.kopo.finalproject.pet.model.dto.Pet;
import com.kopo.finalproject.pet.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class PetController {
    private final PetService petService;

    @Autowired
    public PetController(PetService petService) {
        this.petService = petService;
    }

    @GetMapping("/pets")
    public ResponseEntity<List<Pet>> getAllPetsOfGuest(String guest_id) {
        List<Pet> pets = petService.getAllPetsOfGuest(guest_id); // 데이터베이스에서 모든 제품 정보 가져오기
        return ResponseEntity.ok(pets);
    }
}