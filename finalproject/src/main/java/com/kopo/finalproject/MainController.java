package com.kopo.finalproject;

import com.kopo.finalproject.dto.Invite;
import com.kopo.finalproject.joinsaving.service.JoinSavingService;
import com.kopo.finalproject.pet.model.dto.Pet;
import com.kopo.finalproject.pet.service.PetService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {
    private final JoinSavingService joinSavingService;
    private final PetService petService;

    public MainController(JoinSavingService joinSavingService, PetService petService) {
        this.joinSavingService = joinSavingService;
        this.petService = petService;
    }

    @RequestMapping("/")
    public ModelAndView index(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        List<Pet> pets = petService.getAllPetsOfGuest((String)session.getAttribute("guest_id"));
        mav.addObject("pets",pets);
        System.out.println(pets);
        mav.setViewName("index");
        return mav;
    }

    @RequestMapping("/signInfoPDF")
    public ModelAndView pdf() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("include/signInfoPDF");
        return mav;
    }

    @RequestMapping("/invited")
    public ModelAndView invited(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        List<Invite> inviteInfo = joinSavingService.getInvitedInfo((String) session.getAttribute("accountNumber"));
        mav.setViewName("include/invited-saving-card");
        mav.addObject("inviteInfo", inviteInfo);
        return mav;
    }

    @GetMapping("/invited-pw")
    public ModelAndView invitedPw(@RequestParam(name = "account-number", required = false) String accountNumber, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("include/invited-password-card");
        if (accountNumber != null) session.setAttribute("accountNumber", accountNumber);
        return mav;
    }

    // 초대 거절 시 세션 삭제
    @GetMapping(value = "/delete-session")
    public void deleteAccountNumber(HttpSession session) {
        session.removeAttribute("accountNumber");
    }

//    @RequestMapping("/dashboard")
//    public ModelAndView dashboard() {
//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("dashboard");
//        return mav;
//    }

}

