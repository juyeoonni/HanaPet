package com.kopo.finalproject.guest.model.dao;

import com.kopo.finalproject.guest.model.dto.Guest;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface GuestMapper {
    List<Guest> getAllGuest();

    Guest selectNameOfGuest(String guest_id);

    Guest loginGuest(HashMap<String, String> loginData);
}
