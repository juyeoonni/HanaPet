package com.kopo.finalproject.savingaccount.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class MyPageHistoryInfo {
    private String id;
    private String guestId;
    private String guestName;
    private String accountNumberIn;
    private String accountNumberOut;
    private String transferDate;
    private String amount;
    private String balanceAfterIn;

    public MyPageHistoryInfo() {
    }
}