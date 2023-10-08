package com.kopo.finalproject.joinsaving.service;

import com.kopo.finalproject.dto.Invite;
import com.kopo.finalproject.joinsaving.model.dao.JoinSavingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JoinSavingServiceImpl implements JoinSavingService {
    private final JoinSavingMapper joinSavingMapper;

    @Autowired
    public JoinSavingServiceImpl(JoinSavingMapper joinSavingMapper) {
        this.joinSavingMapper = joinSavingMapper;
    }

    @Override
    public List<Invite> getInvitedInfo(String accountNumber) {
        return joinSavingMapper.getInvitedInfo(accountNumber);
    }

    @Override
    public int getCnt(String accountNumber) {
        return joinSavingMapper.getCnt(accountNumber);
    }

}
