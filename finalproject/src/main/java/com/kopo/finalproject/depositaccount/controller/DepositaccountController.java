package com.kopo.finalproject.depositaccount.controller;

import com.kopo.finalproject.depositaccount.model.dto.Depositaccount;
import com.kopo.finalproject.depositaccount.model.dto.History;
import com.kopo.finalproject.depositaccount.service.DepositaccountService;
import com.kopo.finalproject.insurance.controller.BreedData;
import com.kopo.finalproject.pet.model.dto.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class DepositaccountController {
    private final DepositaccountService depositaccountService;

    @Autowired
    public DepositaccountController(DepositaccountService depositaccountService) {
        this.depositaccountService = depositaccountService;
    }

    @GetMapping("/depositaccounts")
    public ResponseEntity<List<Depositaccount>> getDepositaccount(@RequestParam String guest_id) {
        List<Depositaccount> depositaccounts = depositaccountService.getAllDepositAccountsOfGuest(guest_id); // 데이터베이스에서 모든 제품 정보 가져오기
        return ResponseEntity.ok(depositaccounts);
    }

    @GetMapping("/checkdepositaccountpw")
    public ResponseEntity<Integer> checkDepositAccountPW(@RequestParam HashMap<String, String> checkPWdata) {
        int num = depositaccountService.checkDepositAccountPW(checkPWdata);
        return ResponseEntity.ok(num);
    }


    @GetMapping("/history")
    public ModelAndView getHistory(@RequestParam String account_number) {
        ModelAndView mav = new ModelAndView();
        List<History> historyList = depositaccountService.getHistory(account_number);

        mav.addObject("historyList", historyList); // 결과를 뷰에 전달
        mav.setViewName("include/mypet-account-detail");

        System.out.println("history: " + historyList);
        return mav;
    }

}