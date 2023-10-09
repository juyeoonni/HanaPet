package com.kopo.finalproject.admin.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class AdminPetGender {
    private String gender;
    private String gender_count;
    private String gender_percentage;

    public AdminPetGender() {
    }
}