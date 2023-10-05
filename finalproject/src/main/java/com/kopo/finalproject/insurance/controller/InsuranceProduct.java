package com.kopo.finalproject.insurance.controller;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class InsuranceProduct {
    private String insurance_name;
    private String description;
    private String creation_date;
    private String guarantee;
    private String year;
    private String period;
    private String amount_desc;
    private String amount;
    private String join_age;
    private String rejoin_age;
    private String self_pay;
    private String image;
}