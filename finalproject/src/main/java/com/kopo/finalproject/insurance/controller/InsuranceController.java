package com.kopo.finalproject.insurance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InsuranceController {
    @RequestMapping("/insurance-product")
    public ModelAndView insurance() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("insurance-product");
        return mav;
    }

    @RequestMapping("/insurance-detail")
    public ModelAndView insuranceDetail(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("insurance-detail");
        return mav;
    }

    @RequestMapping("/join-insurance")
    public ModelAndView joinInsurance(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("join-insurance");
        return mav;
    }
}
