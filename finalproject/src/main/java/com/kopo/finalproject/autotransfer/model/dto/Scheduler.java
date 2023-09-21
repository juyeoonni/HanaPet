package com.kopo.finalproject.autotransfer.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Scheduler {
    private String guestId;
    private String accountNumber;
    private String joinDate;
    private String smsTransfer;
    private String transferAmount;
    private String transferPeriod;
    private String currentBalance;
    private String depositAccountNumber;
}
