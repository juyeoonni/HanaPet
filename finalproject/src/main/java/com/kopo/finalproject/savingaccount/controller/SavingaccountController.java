package com.kopo.finalproject.savingaccount.controller;

import com.kopo.finalproject.pet.model.dto.Pet;
import com.kopo.finalproject.pet.service.PetService;
import com.kopo.finalproject.savingaccount.model.dto.MyAccountsOfPet;
import com.kopo.finalproject.savingaccount.model.dto.Savingaccount;
import com.kopo.finalproject.savingaccount.service.SavingaccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class SavingaccountController {
    @Autowired
    private final SavingaccountService savingaccountService;

    @Autowired
    private final PetService petService;

    public SavingaccountController(SavingaccountService savingaccountService, PetService petService) {
        this.savingaccountService = savingaccountService;
        this.petService = petService;
    }

    @GetMapping("/savingaccounts")
    public ResponseEntity<List<MyAccountsOfPet>> getSavingaccount(@RequestParam HashMap<String, String> data) {
        List<MyAccountsOfPet> savingaccounts = savingaccountService.getAllSavingAccountsOfPetOfGuest(data); // 데이터베이스에서 모든 제품 정보 가져오기
        System.out.println("여기" + data);
        return ResponseEntity.ok(savingaccounts);
    }

    @RequestMapping("/mypet")
    public ModelAndView product(HttpSession session) {
        ModelAndView mav = new ModelAndView("mypet");
        String id = (String) session.getAttribute("guest_id");
        List<Pet> pets = petService.getAllPetsOfGuest(id);
        mav.addObject("pets", pets);
        return mav;
    }

    @PostMapping("/join-savingaccounts")
    public ResponseEntity<String> createSavingaccount(@RequestBody HashMap<String, String> data) {
        savingaccountService.joinSavingAccounts(data);
        return ResponseEntity.ok("적금 생성 성공");
    }

    @PostMapping("/join-invited")
    public ResponseEntity<String> joinInvited(@RequestBody HashMap<String, String> data, HttpSession session) {
        savingaccountService.joinInvited(data);
        session.removeAttribute("accountNumber");
        return ResponseEntity.ok("초대 적금 가입 성공");
    }
}