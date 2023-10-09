package com.kopo.finalproject;

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

    public MainController(JoinSavingService joinSavingService, PetService petService, ProductService productService, GuestService guestService, InsuranceService insuranceService) {
        this.joinSavingService = joinSavingService;
        this.petService = petService;
        this.productService = productService;
        this.guestService = guestService;
        this.insuranceService = insuranceService;
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

    @RequestMapping("/admin/dashboard")
    public ModelAndView adminDash() {
        ModelAndView mav = new ModelAndView();
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

        System.out.println(product);
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
        HashMap<String,String> data = new HashMap<>();
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
        mav.setViewName("include/invited-password-card");
        if (accountNumber != null) session.setAttribute("accountNumber", accountNumber);
        return mav;
    }

    // 초대 거절 시 세션 삭제
    @GetMapping(value = "/delete-session")
    public void deleteAccountNumber(HttpSession session) {
        session.removeAttribute("accountNumber");
    }


}

