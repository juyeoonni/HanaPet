package com.kopo.finalproject.guest.service;

import com.kopo.finalproject.guest.model.dto.EndMessageGuest;
import com.kopo.finalproject.guest.model.dto.Guest;

import java.util.HashMap;
import java.util.List;

public interface GuestService {
    public List<Guest> getAllMember();

    List<EndMessageGuest> getEndMessageGuest(String account_number);

    Guest loginGuest(HashMap<String, String> loginData);

    String getKakaoToken(String code);

    Guest getKakaoUserInfo(String access_token);

    Guest selectEmailOneMember(String email);
}
