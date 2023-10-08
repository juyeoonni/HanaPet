package com.kopo.finalproject.guest.controller;

import com.kopo.finalproject.guest.model.dto.Guest;
import com.kopo.finalproject.guest.service.GuestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
class GuestController {
    private final GuestService guestService;

    @Autowired
    public GuestController(GuestService guestService) {
        this.guestService = guestService;
    }

    @PostMapping("/login-guest")
    public ResponseEntity<String> loginGuest(@RequestBody HashMap<String, String> loginData, HttpServletRequest request) {
        Guest loginMember = guestService.loginGuest(loginData);
        HttpSession session = request.getSession();
        System.out.println(loginData);
        if (loginMember != null) {
            session.setAttribute("guest_id", loginMember.getGuest_id());
            session.setAttribute("name", loginMember.getName());
            session.setAttribute("phone", loginMember.getPhone());
            session.setAttribute("email", loginMember.getEmail());
            session.setAttribute("personal_id", loginMember.getPersonal_id());
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

    @GetMapping(value = "/kakao-login", produces = MediaType.APPLICATION_JSON_VALUE)
    public ModelAndView getKakaoUserInfo(String code, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/index");
        HttpSession session = request.getSession();

        //토큰 생성 함수
        String access_token = guestService.getKakaoToken(code);

        //사용자 정보 조회 함수
        Guest member = guestService.getKakaoUserInfo(access_token);

        //사용자 여부 확인 함수
        Guest memberInfo = guestService.selectEmailOneMember(member.getEmail());
        if (memberInfo != null) {
            session.setAttribute("accessToken", access_token);
//            mav.setViewName("/index");
//            mav.addObject("msg", "로그인 성공");
//            mav.addObject("loc", "/");
            session.setAttribute("guest_id", memberInfo.getGuest_id());
            session.setAttribute("name", memberInfo.getName());
            session.setAttribute("phone", memberInfo.getPhone());
            session.setAttribute("email", memberInfo.getEmail());
            session.setAttribute("personal_id", memberInfo.getPersonal_id());
        } else {
        }
        return mav;
    }

    @GetMapping(value = "/logout")
    public ModelAndView deleteMember(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ModelAndView mav = new ModelAndView("/index");
        if (session != null) {
            session.invalidate();
        }
//        mav.addObject("msg", "로그아웃 성공");
//        mav.addObject("loc", "/");
//        mav.setViewName("/message");
        return mav;
    }
}