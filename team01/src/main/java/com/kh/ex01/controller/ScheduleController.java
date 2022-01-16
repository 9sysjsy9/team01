package com.kh.ex01.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ex01.service.ScheduleService;
import com.kh.ex01.vo.ScheduleVo;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Inject
	private ScheduleService scheduleService;

	@RequestMapping(value = "/company/scheduleCalendar")
	public String scheduleCalendar(Model model) {
		
	    LocalDateTime localDate = LocalDateTime.now();
	    DateTimeFormatter yearFormatter = DateTimeFormatter.ofPattern("yyyy");
	    DateTimeFormatter monthFormatter = DateTimeFormatter.ofPattern("MM");

	    int syear = Integer.parseInt(localDate.format(yearFormatter));
	    int smonth = Integer.parseInt(localDate.format(monthFormatter));
	    
	    List<ScheduleVo> list = scheduleService.scheduleDataList(syear, smonth);
		System.out.println("ScheduleController, scheduleCalendar, list : " + list);
		model.addAttribute("scheduleDataList", list);
		return "/company/schedule/scheduleCalendar";
	}
	
	@RequestMapping(value = "/company/scheduleCalendar2")
	public String scheduleCalendar2() {
		return "/company/schedule/scheduleCalendar2";
	}
	
}
