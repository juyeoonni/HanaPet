package com.kopo.finalproject.joinsaving.model.dao;


import com.kopo.finalproject.dto.Invite;
import com.kopo.finalproject.joinsaving.model.dto.JoinSaving;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface JoinSavingMapper {

    // 적금 참여 insert
    void joinSaving(HashMap<String, String> data);

    // 적금 초대 insert
    void inviteSaving(HashMap<String, String> data);

    List<Invite> getInvitedInfo(String guest_id);
}
