package com.kopo.finalproject.admin.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class AdminPetBreed {
    private String breed;
    private String breed_count;
    private String breed_percentage;

    public AdminPetBreed() {
    }
}