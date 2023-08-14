package com.kopo.finalproject.product.controller;

import com.kopo.finalproject.product.model.dto.Product;
import com.kopo.finalproject.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ProductController {

    private final ProductService productService; // ProductService는 데이터베이스 조회를 담당하는 서비스 클래스

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/products")
    public ResponseEntity<List<Product>> getProducts() {
        List<Product> products = productService.getAllProduct(); // 데이터베이스에서 모든 제품 정보 가져오기
        return ResponseEntity.ok(products);
    }


    @RequestMapping("/product")
    public ModelAndView product() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product");
        return mav;
    }


    @RequestMapping("/one-product")
    public ModelAndView oneProduct() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("one-product");
        return mav;
    }
}
