package com.kopo.finalproject.joinsaving.service;

import com.kopo.finalproject.joinsaving.model.dao.JoinSavingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

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
}
