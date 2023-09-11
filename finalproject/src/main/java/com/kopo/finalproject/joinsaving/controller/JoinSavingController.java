package com.kopo.finalproject.joinsaving.controller;

import com.kopo.finalproject.joinsaving.service.JoinSavingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.HashMap;

@Controller
public class JoinSavingController {
    private final JoinSavingService joinSavingService;

    @Autowired
    public JoinSavingController(JoinSavingService joinSavingService){
        this.joinSavingService = joinSavingService;
    }

    @PostMapping("/invite-saving")
    public ResponseEntity<String> inviteJoin(@RequestBody HashMap<String, String> data) {
        joinSavingService.inviteSaving(data);
        return ResponseEntity.ok("적금 초대 성공");
    }
}
