package com.kopo.finalproject.petcalendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PetCalendarController {
    @RequestMapping("/petcalendar")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("calendar");
        return mav;
    }
}
