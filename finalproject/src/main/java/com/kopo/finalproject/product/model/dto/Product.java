package com.kopo.finalproject.product.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Product {
    private String category;
    private String creation_date;
    private double rate;
    private double prime_rate;
    private String description;
    private int min_period;
    private int min_balance;
    private int max_period;
    private int max_balance;
    private String image;

    public Product() {
    }
}
