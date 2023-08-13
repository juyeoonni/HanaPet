package com.kopo.finalproject.guest.service;

import com.kopo.finalproject.guest.model.dao.GuestMapper;
import com.kopo.finalproject.guest.model.dto.Guest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class GuestServiceImpl implements GuestService {

    private final GuestMapper guestMapper;

    @Autowired
    public GuestServiceImpl(GuestMapper guestMapper) {
        this.guestMapper = guestMapper;
    }

    @Override
    public List<Guest> getAllMember() {
        return null;
    }

    @Override
    public Guest selectNameOfMember(String guest_id) {
        return null;
    }

    @Override
    public Guest loginGuest(HashMap<String, String> loginData) {
        return guestMapper.loginGuest(loginData);
    }
}
