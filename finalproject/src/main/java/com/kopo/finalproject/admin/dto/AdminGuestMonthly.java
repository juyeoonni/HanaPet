package com.kopo.finalproject.admin.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class AdminGuestMonthly {
    private String month;
    private String monthly_guest_count;

    public AdminGuestMonthly() {
    }
}