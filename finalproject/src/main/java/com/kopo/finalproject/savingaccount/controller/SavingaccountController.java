package com.kopo.finalproject.savingaccount.controller;

import com.kopo.finalproject.savingaccount.model.dto.Savingaccount;
import com.kopo.finalproject.savingaccount.service.SavingaccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class SavingaccountController {
    private final SavingaccountService savingaccountService;

    @Autowired
    public SavingaccountController(SavingaccountService savingaccountService) {
        this.savingaccountService = savingaccountService;
    }

    @GetMapping("/savingaccounts")
    public ResponseEntity<List<Savingaccount>> getSavingaccount(@RequestParam HashMap<String, String> data) {
        List<Savingaccount> savingaccounts = savingaccountService.getAllSavingAccountsOfPetOfGuest(data); // 데이터베이스에서 모든 제품 정보 가져오기
        return ResponseEntity.ok(savingaccounts);
    }

    @RequestMapping("/mypet")
    public ModelAndView product() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypet");
        return mav;
    }

}