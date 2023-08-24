package com.kopo.finalproject.depositaccount.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Depositaccount {
    private String account_number;
    private String guest_id;
    private int balance;
    private String account_pw;

    public Depositaccount() {
    }
}