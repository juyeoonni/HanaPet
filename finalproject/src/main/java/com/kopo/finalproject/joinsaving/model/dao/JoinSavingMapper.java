package com.kopo.finalproject.joinsaving.model.dao;


import com.kopo.finalproject.dto.Invite;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface JoinSavingMapper {

    // 적금 참여 insert
    void joinSaving(HashMap<String, String> data);

    void updateContributionAmount(HashMap<String, String> data);

    List<Invite> getInvitedInfo(String accountNumber);

    int getCnt(String accountNumber);
}
