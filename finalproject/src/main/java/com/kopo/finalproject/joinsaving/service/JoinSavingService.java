package com.kopo.finalproject.joinsaving.service;

import com.kopo.finalproject.dto.Invite;
import com.kopo.finalproject.joinsaving.model.dto.JoinSaving;

import java.util.HashMap;
import java.util.List;

public interface JoinSavingService {
    void inviteSaving(HashMap<String, String> data);
    List<Invite> getInvitedInfo(String guest_id);
}
