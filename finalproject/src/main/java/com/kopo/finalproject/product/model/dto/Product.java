package com.kopo.finalproject.product.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Product {
    private String category;
    private String rate;
    private String description;
    private String min_period;
    private String min_balance;

    public Product() {
    }
}
