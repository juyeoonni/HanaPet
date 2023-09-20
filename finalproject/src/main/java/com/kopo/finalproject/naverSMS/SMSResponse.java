package com.kopo.finalproject.naverSMS;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
public class SMSResponse {
    private String requestId;
    private LocalDateTime requestTime;
    private String statusCode;
    private String statusName;
}