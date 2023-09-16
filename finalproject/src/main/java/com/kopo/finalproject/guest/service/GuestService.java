package com.kopo.finalproject.guest.service;

import com.kopo.finalproject.guest.model.dto.Guest;

import java.util.HashMap;
import java.util.List;

public interface GuestService {
    public List<Guest> getAllMember();

    Guest loginGuest(HashMap<String, String> loginData);

    String getKakaoToken(String code);

    Guest getKakaoUserInfo(String access_token);

    Guest selectEmailOneMember(String email);
}
