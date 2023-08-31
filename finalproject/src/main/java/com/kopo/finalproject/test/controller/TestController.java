package com.kopo.finalproject.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

    @RequestMapping("/test/start")
    public ModelAndView test() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("test/test-start");
        return mav;
    }

    @RequestMapping("/test/1")
    public ModelAndView test1() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("test/test-1");
        return mav;
    }

    @RequestMapping("/test/2")
    public ModelAndView test2() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("test/test-2");
        return mav;
    }

    @RequestMapping("/test/3")
    public ModelAndView test3() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("test/test-3");
        return mav;
    }

    @RequestMapping("/test/4")
    public ModelAndView test4() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("test/test-4");
        return mav;
    }

    @RequestMapping("/test/result")
    public ModelAndView test_result() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("test/test-result");
        return mav;
    }
}
