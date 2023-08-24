package com.kopo.finalproject.product.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Product {
    private String category;
    private double rate;
    private String description;
    private int min_period;
    private int min_balance;
    private String image;

    public Product() {
    }
}
