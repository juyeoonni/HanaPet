package com.kopo.finalproject.guest.controller;

import com.kopo.finalproject.guest.model.dto.Guest;
import com.kopo.finalproject.guest.service.GuestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
class TestController {
    private final GuestService guestService;

    @Autowired
    public TestController(GuestService guestService) {
        this.guestService = guestService;
    }

    @RequestMapping("/")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");
        return mav;
    }

    @PostMapping("/login-guest")
    public ResponseEntity<String> loginGuest(@RequestBody HashMap<String, String> loginData, HttpServletRequest request) {
        Guest loginMember = guestService.loginGuest(loginData);
        HttpSession session = request.getSession();
        System.out.println(loginData);
        if (loginMember != null) {
            session.setAttribute("name", loginMember.getName());
            session.setAttribute("id", loginMember.getGuest_id());
            return ResponseEntity.ok("로그인 성공");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("로그인 실패");
        }
    }

    @RequestMapping("/login")
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("login");
        return mav;
    }

    @RequestMapping("/register")
    public ModelAndView register() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("register");
        return mav;
    }

    @RequestMapping(value = "/logout")
    public ModelAndView deleteMember(HttpSession session) {
        String guest_id = (String) session.getAttribute("guest_id");
        ModelAndView mav = new ModelAndView();
        session.invalidate();
        mav.addObject("msg", "로그아웃 성공");
        mav.addObject("loc", "/");
        mav.setViewName("message");
        return mav;
    }
}