package com.kopo.finalproject.joinsaving.service;

import com.kopo.finalproject.dto.Invite;
import com.kopo.finalproject.joinsaving.model.dao.JoinSavingMapper;
import com.kopo.finalproject.joinsaving.model.dto.JoinSaving;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class JoinSavingServiceImpl implements JoinSavingService {
    private final JoinSavingMapper joinSavingMapper;

    @Autowired
    public JoinSavingServiceImpl(JoinSavingMapper joinSavingMapper) {
        this.joinSavingMapper = joinSavingMapper;
    }

    @Override
    public void inviteSaving(HashMap<String, String> data) {
        joinSavingMapper.inviteSaving(data);
    }

    @Override
    public List<Invite> getInvitedInfo(String guest_id) {
        return joinSavingMapper.getInvitedInfo(guest_id);
    }


}
