package com.kopo.finalproject.joinsaving.service;

import com.kopo.finalproject.dto.Invite;

import java.util.HashMap;
import java.util.List;

public interface JoinSavingService {
    List<Invite> getInvitedInfo(HashMap<String, String> data);
    int getCnt(String accountNumber);
}
