package com.kopo.finalproject.product.model.dao;

import com.kopo.finalproject.product.model.dto.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper {

    // 모든 적금 상품 불러오기 select
    List<Product> getAllProduct();

    Product getProductByCategory(String category);

    void updateProduct(Product product);

    void insertProduct(Product product);
}
