package com.kopo.finalproject.joinsaving.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class JoinSaving {
    private String guest_id;
    private String account_number;
    private String join_date;
    private String deposit_account_number;
    private String accept_status;
    private String sms_transfer;
    private String sms_maturity;
    private String contribution_amount;
    private String contribution_ratio;

    public JoinSaving() {
    }
}
