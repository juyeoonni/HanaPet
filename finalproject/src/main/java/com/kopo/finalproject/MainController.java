package com.kopo.finalproject;

import com.kopo.finalproject.dto.Invite;
import com.kopo.finalproject.joinsaving.model.dto.JoinSaving;
import com.kopo.finalproject.joinsaving.service.JoinSavingService;
import com.kopo.finalproject.savingaccount.model.dto.Savingaccount;
import com.kopo.finalproject.savingaccount.service.SavingaccountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {
    private final JoinSavingService joinSavingService;

    public MainController(JoinSavingService joinSavingService) {
        this.joinSavingService = joinSavingService;
    }

    @RequestMapping("/")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView();
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
        List<Invite> inviteInfo = joinSavingService.getInvitedInfo((String) session.getAttribute("guest_id"));

        if (inviteInfo.isEmpty()) {
            mav.setViewName("index");
        } else {
            mav.setViewName("include/invited-saving-modal");
        }
        mav.addObject("inviteInfo", inviteInfo);
        return mav;
    }
}

