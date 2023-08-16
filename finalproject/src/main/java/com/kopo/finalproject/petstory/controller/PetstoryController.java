package com.kopo.finalproject.petstory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PetstoryController {
    @GetMapping("/petstory-start")
    public ModelAndView petstoryStart() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("petstory-start");
        return mav;
    }
}