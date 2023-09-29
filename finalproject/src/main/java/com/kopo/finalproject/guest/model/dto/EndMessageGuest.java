package com.kopo.finalproject.guest.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class EndMessageGuest {

    private String name;
    private String phone;
    private String savingName;

    public EndMessageGuest() {
    }
}
