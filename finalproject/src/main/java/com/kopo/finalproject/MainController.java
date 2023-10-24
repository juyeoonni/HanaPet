package com.kopo.finalproject;

import com.kopo.finalproject.admin.AdminService;
import com.kopo.finalproject.admin.dto.*;
import com.kopo.finalproject.autotransfer.service.AutoTransferService;
import com.kopo.finalproject.dto.Invite;
import com.kopo.finalproject.guest.model.dto.EmailGuest;
import com.kopo.finalproject.guest.service.GuestService;
import com.kopo.finalproject.insurance.controller.InsuranceProduct;
import com.kopo.finalproject.insurance.controller.InsuranceService;
import com.kopo.finalproject.joinsaving.service.JoinSavingService;
import com.kopo.finalproject.pet.model.dto.Pet;
import com.kopo.finalproject.pet.service.PetService;
import com.kopo.finalproject.product.model.dto.Product;
import com.kopo.finalproject.product.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class MainController {
    private final JoinSavingService joinSavingService;
    private final PetService petService;
    private final ProductService productService;
    private final GuestService guestService;

    private final InsuranceService insuranceService;

    private final AdminService adminService;
    private final AutoTransferService autoTransferService;

    public MainController(JoinSavingService joinSavingService, PetService petService, ProductService productService, GuestService guestService, InsuranceService insuranceService, AdminService adminService, AutoTransferService autoTransferService) {
        this.joinSavingService = joinSavingService;
        this.petService = petService;
        this.productService = productService;
        this.guestService = guestService;
        this.insuranceService = insuranceService;
        this.adminService = adminService;
        this.autoTransferService = autoTransferService;
    }

    @RequestMapping("/")
    public ModelAndView index(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        List<Pet> pets = null;
        if (session.getAttribute("guest_id") != null) {
            pets = petService.getAllPetsOfGuest((String) session.getAttribute("guest_id"));
        }
        mav.addObject("pets", pets);
        System.out.println(pets);
        mav.setViewName("index");
        return mav;
    }

    @RequestMapping("/minsu")
    public String ms() {
        return "logic";
    }

    @RequestMapping("/yulim")
    public String d() {
        return "logic2";
    }

    @RequestMapping(value = "/a", method = RequestMethod.POST)
    public void a(@RequestParam("text") String text) {
        autoTransferService.autoTransfer("10000", "493-352-174-47356", "343-531930-81155", "minsu_04", text);
    }

    @RequestMapping(value = "/b", method = RequestMethod.POST)
    public void b(@RequestParam("text") String text) {
        autoTransferService.autoTransfer("150000", "493-293-143-13524", "343-531930-81155", "yulim98", text);
        autoTransferService.autoTransfer("100000", "491-153-352-29482", "343-531930-81155", "heejin70", text);
    }

    @RequestMapping("/admin/dashboard")
    public ModelAndView adminDash() {
        ModelAndView mav = new ModelAndView();
        int guestCnt = adminService.getGuestCnt();
        int petCnt = adminService.getPetCnt();
        List<AdminPetAge> adminPetAgeList = adminService.getPetAgeCnt();
        List<AdminPetBreed> adminPetBreedList = adminService.getPetBreedCnt();
        List<AdminPetGender> adminPetGenderList = adminService.getPetGenderCnt();
        List<AdminGuestMonthly> adminGuestMonthlyList = adminService.getGuestJoinCnt();
        List<AdminSaving> adminSavingList = adminService.getSavingCnt();
        List<AdminInsurance> adminInsuranceList = adminService.getInsuranceCnt();

        mav.addObject("guestCnt", guestCnt);
        mav.addObject("petCnt", petCnt);
        mav.addObject("adminPetAgeList", adminPetAgeList);
        mav.addObject("adminPetBreedList", adminPetBreedList);
        mav.addObject("adminPetGenderList", adminPetGenderList);
        mav.addObject("adminGuestMonthlyList", adminGuestMonthlyList);
        mav.addObject("adminSavingList", adminSavingList);
        mav.addObject("adminInsuranceList", adminInsuranceList);

        mav.setViewName("admin/admin-main");
        return mav;
    }

    @RequestMapping("/admin/saving-product")
    public ModelAndView adminSaving() {
        ModelAndView mav = new ModelAndView();
        List<Product> savingProducts = null;
        savingProducts = productService.getAllProduct();
        mav.addObject("products", savingProducts);
        System.out.println(savingProducts);
        mav.setViewName("admin/admin-saving-product");
        return mav;
    }

    @RequestMapping("/admin/insu-product")
    public ModelAndView adminInsu() {
        ModelAndView mav = new ModelAndView();
        List<InsuranceProduct> insuProducts = null;
        insuProducts = insuranceService.getAllInsuranceProduct();
        mav.addObject("products", insuProducts);
        System.out.println(insuProducts);
        mav.setViewName("admin/admin-insu-product");
        return mav;
    }

    @RequestMapping("/admin/insert-saving-product")
    public ModelAndView adminInsertSaving() {
        ModelAndView mav = new ModelAndView();
        List<Product> savingProducts = null;
        savingProducts = productService.getAllProduct();
        mav.addObject("products", savingProducts);
        System.out.println(savingProducts);
        mav.setViewName("admin/admin-insert-saving-product");
        return mav;
    }

    @RequestMapping("/admin/update-saving-product")
    public ModelAndView adminUpdateSaving(HttpServletRequest req, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String category = req.getParameter("category");
        Product product = productService.getProductByCategory(category);
        mav.addObject("product", product);
        System.out.println(product);
        mav.setViewName("admin/admin-update-saving-product");
        return mav;
    }

    @PostMapping("/productAdminUpdateProc")
    public String productAdminUpdateProc(@ModelAttribute Product product) {
        productService.updateProduct(product);
        return "redirect:/admin/saving-product";
    }

    @PostMapping("/productAdminInsertProc")
    public String productAdminInsertProc(@ModelAttribute Product product) {
        productService.insertProduct(product);
        return "redirect:/admin/saving-product";
    }

    @PostMapping("/deleteproduct")
    public String deleteProduct(HttpServletRequest req) {

        String category = req.getParameter("category");
        productService.deleteproduct(category);
        return "redirect:/admin/saving-product";
    }

    @RequestMapping("/admin/email")
    public ModelAndView adminEmail(HttpServletRequest req) {
        ModelAndView mav = new ModelAndView();
        String category = req.getParameter("category");
        Product product = productService.getProductByCategory(category);
        List<EmailGuest> emailGuestList = guestService.getEmailGuest();
        List<Product> productList = productService.getAllProduct();
        List<InsuranceProduct> insuranceProductList = insuranceService.getAllInsuranceProduct();

        mav.addObject("product", product);
        mav.addObject("emailGuestList", emailGuestList);
        mav.addObject("productList", productList);
        mav.addObject("insuranceProductList", insuranceProductList);

        System.out.println(emailGuestList);
        mav.setViewName("admin/admin-mail");
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
        HashMap<String, String> data = new HashMap<>();
        data.put("accountNumber", (String) session.getAttribute("accountNumber"));
        data.put("guestId", (String) session.getAttribute("guest_id"));
        List<Invite> inviteInfo = joinSavingService.getInvitedInfo(data);
        mav.setViewName("include/invited-saving-card");
        mav.addObject("inviteInfo", inviteInfo);
        return mav;
    }

    @GetMapping("/invited-pw")
    public ModelAndView invitedPw(@RequestParam(name = "account-number", required = false) String
                                          accountNumber, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String accountPW = joinSavingService.getInvitedPW(accountNumber);
        mav.addObject("accountPW", accountPW);
        mav.setViewName("include/invited-password-card");
        System.out.println(accountPW + "야");
        if (accountNumber != null) session.setAttribute("accountNumber", accountNumber);
        return mav;
    }

    // 초대 거절 시 세션 삭제
    @GetMapping(value = "/delete-session")
    public void deleteAccountNumber(HttpSession session) {
        session.removeAttribute("accountNumber");
    }


}

