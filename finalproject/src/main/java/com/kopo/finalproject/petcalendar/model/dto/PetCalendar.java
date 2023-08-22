package com.kopo.finalproject.petcalendar.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class PetCalendar {
    private String event_id;
    private String event_date;
    private String creation_date;
    private String content;
    private int pet_id;

    public PetCalendar() {
    }
}
