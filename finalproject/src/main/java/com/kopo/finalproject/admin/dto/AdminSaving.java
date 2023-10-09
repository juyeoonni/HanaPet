package com.kopo.finalproject.admin.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class AdminSaving {
    private String category;
    private String category_accounts;
    private String account_percentage;
    private String category_guests;

    public AdminSaving() {
    }
}