package com.kopo.finalproject.petcalendar.model.dao;

import com.kopo.finalproject.petcalendar.model.dto.PetCalendar;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface PetCalendarMapper {
    List<PetCalendar> getDayEventsOfPet(String event_date, int pet_id);

    List<PetCalendar> getMonthEventsOfPet(String month, int pet_id);

    void insertEventOfPet(HashMap<String,String> data);
}
