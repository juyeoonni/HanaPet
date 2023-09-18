package com.kopo.finalproject.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Invite {
    private String openerName;
    private String invitedGuestId;
    private String accountNumber;
    private String inviteDate;
    private String savingName;
    private String petName;
    private String petImg;
    private String category;
    private String rate;
    private String description;
    private String minBalance;
    private String maxBalance;
    private String productImg;
    private String endDate;
    private String joinPeriod;
    private String finalAmount;
    private String interestAmount;


}
