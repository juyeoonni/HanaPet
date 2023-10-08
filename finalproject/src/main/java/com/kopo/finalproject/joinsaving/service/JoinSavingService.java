package com.kopo.finalproject.joinsaving.service;

import com.kopo.finalproject.dto.Invite;

import java.util.List;

public interface JoinSavingService {
    List<Invite> getInvitedInfo(String accountNumber);
    int getCnt(String accountNumber);
}
