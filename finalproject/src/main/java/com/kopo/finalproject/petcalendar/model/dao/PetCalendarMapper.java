package com.kopo.finalproject.petcalendar.model.dao;

import com.kopo.finalproject.petcalendar.model.dto.PetCalendar;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface PetCalendarMapper {

    // 반려견의 일정 날짜 리스트 select
    List<PetCalendar> getDayEventsOfPet(String event_date, int pet_id);

    // 반려견의 한달 일정 가져오기 select
    List<PetCalendar> getMonthEventsOfPet(String month, int pet_id);

    // 반려견 일정 추가 insert
    void insertEventOfPet(HashMap<String, String> data);
}
