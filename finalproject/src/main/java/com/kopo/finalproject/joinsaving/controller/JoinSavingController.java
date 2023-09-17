package com.kopo.finalproject.joinsaving.controller;

import com.kopo.finalproject.joinsaving.service.JoinSavingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class JoinSavingController {
    private final JoinSavingService joinSavingService;

    @Autowired
    public JoinSavingController(JoinSavingService joinSavingService) {
        this.joinSavingService = joinSavingService;
    }

}
