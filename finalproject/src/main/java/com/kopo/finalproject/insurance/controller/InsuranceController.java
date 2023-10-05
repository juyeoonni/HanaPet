package com.kopo.finalproject.insurance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;
import java.util.stream.Collectors;

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
        List<InsuranceProduct> insuranceProductList = insuranceService.getAllInsuranceProduct();
        mav.addObject("insuranceProductList", insuranceProductList);
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
    public ModelAndView insuranceRecommend() {
        ModelAndView mav = new ModelAndView();

        List<BreedData> breedDataList = insuranceService.getBreedOne();

        List<String> order = Arrays.asList("1살 미만", "1-3살", "4-6살", "7-9살", "10-12살", "13-15살", "16살 이상");

        List<BreedRatio> breedRatioList = insuranceService.getBreedRatio();
        List<AgeTopThree> ageTopThreeList = insuranceService.getAgeTopThree().stream()
                .sorted(Comparator.comparingInt(age -> order.indexOf(age.getAge_group())))
                .collect(Collectors.toList());

        System.out.println("보험 추천1" + breedDataList);
        System.out.println("보험 추천2" + breedRatioList);
        System.out.println("보험 추천3" + ageTopThreeList);

        mav.addObject("breedData", breedDataList); // 결과를 뷰에 전달
        mav.addObject("breedRatio", breedRatioList); // 결과를 뷰에 전달
        mav.addObject("ageTopThree", ageTopThreeList); // 결과를 뷰에 전달

        mav.setViewName("insurance-recommend");

        return mav;
    }

    @GetMapping("/getInsuRecommend")
    @ResponseBody
    public List<InsuranceProduct> getInsuRecommend(@RequestParam String word) {
        return insuranceService.getInsuRecommend(word);
    }


    // 나의 반려견의 보험 목록 가져오기
    @GetMapping("/myinsurances")
    public ResponseEntity<List<MyInsurance>> getInsurances(@RequestParam HashMap<String, String> data) {
        List<MyInsurance> insurances = insuranceService.getAllInsurancesOfPetOfGuest(data); // 데이터베이스에서 모든 제품 정보 가져오기\
        System.out.println(insurances);
        return ResponseEntity.ok(insurances);
    }

    @GetMapping("/mypet-insurance/detail")
    public ModelAndView getInsuDeatil(@RequestParam String insu_id) {
        ModelAndView mav = new ModelAndView();
        MyInsurance insu = insuranceService.getInsuDeatil(insu_id);

        mav.addObject("insu", insu); // 결과를 뷰에 전달
        mav.setViewName("include/mypet-insurance-detail");

        System.out.println("insu: " + insu);
        return mav;
    }
}
