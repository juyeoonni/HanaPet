package com.kopo.finalproject.insurance.controller;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class BreedData {
    private String breed;
    private String disease;
    private String percentage;
}