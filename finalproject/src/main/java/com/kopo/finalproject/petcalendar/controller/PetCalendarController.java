package com.kopo.finalproject.petcalendar.controller;

import com.kopo.finalproject.petcalendar.model.dto.PetCalendar;
import com.kopo.finalproject.petcalendar.service.PetCalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class PetCalendarController {
    private final PetCalendarService petCalendarService;

    @Autowired
    public PetCalendarController(PetCalendarService petCalendarService) {
        this.petCalendarService = petCalendarService;
    }

    @RequestMapping("/petcalendar")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("calendar");
        return mav;
    }

    @GetMapping("/daycalendars")
    public ResponseEntity<List<PetCalendar>> getEventsOfPet(String event_date, int pet_id) {
        List<PetCalendar> petCalendars = petCalendarService.getDayEventsOfPet(event_date, pet_id);
        return ResponseEntity.ok(petCalendars);
    }

    @GetMapping("/monthcalendars")
    public ResponseEntity<List<PetCalendar>> getMonthEventsOfPet(String month, int pet_id) {
        List<PetCalendar> petCalendars = petCalendarService.getMonthEventsOfPet(month, pet_id);
        return ResponseEntity.ok(petCalendars);
    }

    @PostMapping("/insertcalendar")
    public ResponseEntity<String> insertCalendarOfPet(@RequestBody HashMap<String, String> data) {
        petCalendarService.insertEventOfPet(data);
        return ResponseEntity.ok("insert 성공");
    }
}
