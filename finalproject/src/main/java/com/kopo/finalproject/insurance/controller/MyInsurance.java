package com.kopo.finalproject.insurance.controller;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class MyInsurance {
    private String joinInsuranceId;
    private String guestId;
    private String guestName;
    private String petId;
    private String petName;
    private String insuranceName;
    private String joinDate;
    private String depositAccountNumber;
    private String paymentCount;
    private String insuranceAmount;
}