package com.kopo.finalproject.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
class TestController {
    @RequestMapping("/")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");
        return mav;
    }

//    @PostMapping("/login")
//    public ResponseEntity<String> loginMember(@RequestBody HashMap<String, String> loginData, HttpServletRequest request) {
//        Member loginMember = memberService.loginMember(loginData);
//        HttpSession session = request.getSession();
//        if (loginMember != null) {
//            session.setAttribute("name", loginMember.getName());
//            session.setAttribute("email", loginMember.getEmail());
//            return ResponseEntity.ok("로그인 성공");
//        } else {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("로그인 실패");
//        }
//    }

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
}