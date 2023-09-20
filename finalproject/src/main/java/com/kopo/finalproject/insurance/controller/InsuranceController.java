package com.kopo.finalproject.insurance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class InsuranceController {

    private final InsuranceService insuranceService;

    @Autowired
    public InsuranceController(InsuranceService insuranceService) {
        this.insuranceService = insuranceService;
    }

    @RequestMapping("/insurance-product")
    public ModelAndView insurance() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("insurance-product");
        return mav;
    }

    @RequestMapping("/insurance-detail")
    public ModelAndView insuranceDetail() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("insurance-detail");
        return mav;
    }

    @RequestMapping("/join-insurance")
    public ModelAndView joinInsurance() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("join-insurance");
        return mav;
    }

    @GetMapping("/insurance-recommend")
    public ModelAndView insuranceRecommend(@RequestParam List<String> breed) {
        ModelAndView mav = new ModelAndView();

        List<List<BreedData>> breedDataList = new ArrayList<>(); // 결과를 저장할 리스트

        for (String individualBreed : breed) {
            List<BreedData> individualResult = insuranceService.getBreedData(individualBreed);
            breedDataList.add(individualResult);
        }

        mav.addObject("breedData", breedDataList); // 결과를 뷰에 전달
        mav.setViewName("insurance-recommend");

        return mav;
    }
}
