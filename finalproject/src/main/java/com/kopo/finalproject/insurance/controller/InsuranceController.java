package com.kopo.finalproject.insurance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

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
    public ModelAndView insuranceRecommend(@RequestParam String breed) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("breedData", insuranceService.getBreedData(breed));
        System.out.println(insuranceService.getBreedData(breed));
        mav.setViewName("insurance-recommend");

        return mav;
    }


}
