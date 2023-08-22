package com.kopo.finalproject.petcalendar.service;

import com.kopo.finalproject.petcalendar.model.dto.PetCalendar;

import java.util.HashMap;
import java.util.List;

public interface PetCalendarService {

    // 펫의 캘린더 일정 모두 불러오기
    List<PetCalendar> getDayEventsOfPet(String event_date, int pet_id);

    List<PetCalendar> getMonthEventsOfPet(String month, int pet_id);

    void insertEventOfPet(HashMap<String,String> petCalendar);

}
