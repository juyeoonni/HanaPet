package com.kopo.finalproject.guest.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Guest {
    private String guest_id;
    private String name;
    private String type;
    private String email;
    private String personal_id;
    private int age;
    private String pw;
    private String reg_date;
    private String phone;
    public Guest() {
    }
}
