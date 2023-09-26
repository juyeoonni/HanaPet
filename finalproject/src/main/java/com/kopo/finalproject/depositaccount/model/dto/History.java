package com.kopo.finalproject.depositaccount.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class History {
    private String account_number;
    private String transaction_date;
    private String inout;
    private String transaction_amount;
    private String balance;
    private String transaction_class;
    private String content;

    public History() {
    }
}