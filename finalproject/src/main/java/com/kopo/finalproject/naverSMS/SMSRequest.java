package com.kopo.finalproject.naverSMS;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class SMSRequest {
    private String type;
    private String contentType;
    private String countryCode;
    private String from;
    private String content;
    private List<Message> messages;
}