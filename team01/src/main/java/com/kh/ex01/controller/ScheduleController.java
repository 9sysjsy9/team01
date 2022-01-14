package com.kh.ex01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {

	@RequestMapping(value = "/company/scheduleCalendar")
	public String scheduleCalendar() {
		return "/company/schedule/scheduleCalendar";
	}
	
	@RequestMapping(value = "/company/scheduleCalendar2")
	public String scheduleCalendar2() {
		return "/company/schedule/scheduleCalendar2";
	}
	
}
