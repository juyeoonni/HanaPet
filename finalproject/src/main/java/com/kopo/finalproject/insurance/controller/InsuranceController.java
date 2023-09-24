package com.kopo.finalproject.insurance.controller;

import com.kopo.finalproject.savingaccount.model.dto.MyAccountsOfPet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class InsuranceController {

    private final InsuranceService insuranceService;

    @Autowired
    public InsuranceController(InsuranceService insuranceService) {
        this.insuranceService = insuranceService;
    }

    @RequestMapping("/insurance-product")
    public ModelAndView insurance() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("insurance-product");
        return mav;
    }

    @RequestMapping("/insurance-detail")
    public ModelAndView insuranceDetail() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("insurance-detail");
        return mav;
    }

    @RequestMapping("/join-insurance")
    public ModelAndView joinInsurance() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("join-insurance");
        return mav;
    }

    // 보험 가입
    @PostMapping("/join-insuranceProduct")
    public ResponseEntity<String> createInsurance(@RequestBody HashMap<String, String> data) {
        insuranceService.joinInsurance(data);
        return ResponseEntity.ok("보험 생성 성공");
    }

    @GetMapping("/insurance-recommend")
    public ModelAndView insuranceRecommend(@RequestParam List<String> breed) {
        ModelAndView mav = new ModelAndView();

        List<List<BreedData>> breedDataList = new ArrayList<>(); // 결과를 저장할 리스트

        for (String individualBreed : breed) {
            List<BreedData> individualResult = insuranceService.getBreedData(individualBreed);
            breedDataList.add(individualResult);
        }

        mav.addObject("breedData", breedDataList); // 결과를 뷰에 전달
        mav.setViewName("insurance-recommend");

        return mav;
    }

    // 나의 반려견의 보험 목록 가져오기
    @GetMapping("/myinsurances")
    public ResponseEntity<List<MyInsurance>> getInsurances(@RequestParam HashMap<String, String> data) {
        List<MyInsurance> insurances = insuranceService.getAllInsurancesOfPetOfGuest(data); // 데이터베이스에서 모든 제품 정보 가져오기\
        System.out.println(insurances);
        return ResponseEntity.ok(insurances);
    }
}
