package com.kopo.finalproject.guest.service;

import com.kopo.finalproject.guest.model.dto.Guest;
import com.kopo.finalproject.joinsaving.model.dto.JoinSaving;

import java.util.HashMap;
import java.util.List;

public interface GuestService {
    public List<Guest> getAllMember();

    Guest selectNameOfMember(String guest_id);

    Guest loginGuest(HashMap<String, String> loginData);

}
