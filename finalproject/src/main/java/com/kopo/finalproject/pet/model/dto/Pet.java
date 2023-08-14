package com.kopo.finalproject.pet.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Pet {
    private String pet_id;
    private String name;
    private String breed;
    private String gender;
    private String birth;
    private String image;
    private String month_age;
    private String age_group;

    public Pet() {
    }
}