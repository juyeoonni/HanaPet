package com.kopo.finalproject.product.model.dao;

import com.kopo.finalproject.product.model.dto.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper {

    List<Product> getAllProduct();
}
