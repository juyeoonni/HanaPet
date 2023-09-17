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
    private int current_balance;
    private String saving_name;
    private int pet_id;
    private int join_period;
    private double progress_rate;
    private int end_balance;

    public Savingaccount() {
    }
}