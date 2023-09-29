package com.kopo.finalproject.autotransfer.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class EndTransferInfo {

    private String guestId;
    private String name;
    private String accountNumber;
    private String depositAccountNumber;
    private String finalAmount;
    private String interestAmount;

    public EndTransferInfo() {
    }
}
