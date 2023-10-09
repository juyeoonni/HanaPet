package com.kopo.finalproject.admin.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class AdminInsurance {
    private String INSURANCE_NAME;
    private String insurance_guests;
    private String percentage;

    public AdminInsurance() {
    }
}