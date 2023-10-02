package com.kopo.finalproject.guest.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class EmailGuest {
    private String guest_id;
    private String name;
    private String email;
    private String reg_date;
    private String pet_cnt;

    public EmailGuest() {
    }
}
