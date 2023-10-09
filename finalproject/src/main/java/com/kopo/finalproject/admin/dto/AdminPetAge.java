package com.kopo.finalproject.admin.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class AdminPetAge {
    private String age;
    private String age_count;
    private String age_percentage;

    public AdminPetAge() {
    }
}