package com.kopo.finalproject.product.service;


import com.kopo.finalproject.product.model.dto.Product;

import java.util.List;

public interface ProductService {
    public List<Product> getAllProduct();

    public Product getProductByCategory(String category);

    void updateProduct(Product product);

    void insertProduct(Product product);
}
