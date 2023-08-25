package com.kopo.finalproject.depositaccount.controller;

import com.kopo.finalproject.depositaccount.model.dto.Depositaccount;
import com.kopo.finalproject.depositaccount.service.DepositaccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

}