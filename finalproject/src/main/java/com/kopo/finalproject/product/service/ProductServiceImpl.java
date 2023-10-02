package com.kopo.finalproject.product.service;

import com.kopo.finalproject.product.model.dao.ProductMapper;
import com.kopo.finalproject.product.model.dto.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    private final ProductMapper productMapper;

    @Autowired
    public ProductServiceImpl(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    @Override
    public List<Product> getAllProduct() {
        return productMapper.getAllProduct();
    }

    @Override
    public Product getProductByCategory(String category) {
        return productMapper.getProductByCategory(category);
    }
}
