package com.kopo.finalproject.savingaccount.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class MyAccountsOfPet {
    private String accountNumber;
    private String balance;
    private String savingName;
    private String progressRate;
    private String openerId;
    private String categoryImg;

    public MyAccountsOfPet() {
    }
}