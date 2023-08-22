package com.kopo.finalproject.petcalendar.service;

import com.kopo.finalproject.petcalendar.model.dao.PetCalendarMapper;
import com.kopo.finalproject.petcalendar.model.dto.PetCalendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class PetCalendarServiceImpl implements PetCalendarService {

    private final PetCalendarMapper petCalendarMapper;

    @Autowired
    public PetCalendarServiceImpl(PetCalendarMapper petCalendarMapper) {
        this.petCalendarMapper = petCalendarMapper;
    }

    @Override
    public List<PetCalendar> getDayEventsOfPet(String event_date, int pet_id) {
        return petCalendarMapper.getDayEventsOfPet(event_date, pet_id);
    }

    @Override
    public List<PetCalendar> getMonthEventsOfPet(String month, int pet_id) {
        return petCalendarMapper.getMonthEventsOfPet(month, pet_id);
    }

    @Override
    public void insertEventOfPet(HashMap<String,String> data) {
        petCalendarMapper.insertEventOfPet(data);
    }
}
