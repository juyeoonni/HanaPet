package com.kopo.finalproject.savingaccount.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Savingaccount {
    private String account_number;
    private String opening_date;
    private String end_date;
    private String category;
    private String opener_id;
    private String current_balance;
    private String saving_name;
    private String emoticon_id;
    private String pet_id;
    private String progress_rate;

    public Savingaccount() {
    }
}