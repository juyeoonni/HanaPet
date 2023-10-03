package com.kopo.finalproject.insurance.controller;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class AgeTopThree {
    private String age_group;
    private String top_disease_1;
    private String top_disease_1_percentage;
    private String top_disease_2;
    private String top_disease_2_percentage;
    private String top_disease_3;
    private String top_disease_3_percentage;

}