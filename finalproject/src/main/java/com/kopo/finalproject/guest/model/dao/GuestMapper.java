package com.kopo.finalproject.guest.model.dao;

import com.kopo.finalproject.guest.model.dto.Guest;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface GuestMapper {
    List<Guest> getAllGuest();

    // 로그인하기 (select)
    Guest loginGuest(HashMap<String, String> loginData);
}
