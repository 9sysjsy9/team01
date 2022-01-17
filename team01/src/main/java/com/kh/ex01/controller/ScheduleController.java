package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ex01.service.ScheduleService;
import com.kh.ex01.vo.ScheduleVo;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Inject
	private ScheduleService scheduleService;

	@RequestMapping(value = "/company/scheduleCalendar")
	public String scheduleCalendar() {
		
//		LocalDateTime nowDate = LocalDateTime.now();
//	    DateTimeFormatter yearFormatter = DateTimeFormatter.ofPattern("yyyy");
//	    DateTimeFormatter monthFormatter = DateTimeFormatter.ofPattern("MM");
//
//	    int syear = Integer.parseInt(nowDate.format(yearFormatter));
//	    int smonth = Integer.parseInt(nowDate.format(monthFormatter));
//		
//	    List<ScheduleVo> list =  scheduleService.scheduleDataList(syear, smonth);
//	    model.addAttribute("scheduleDatalist", list);
//	    System.out.println("ScheduleController, scheduleCalendar, list : " + list);
	    
		return "/company/schedule/scheduleCalendar";
	}
	
	@ResponseBody
	@RequestMapping(value = "/company/getMonthScheduleDataList", method=RequestMethod.POST)
	public List<ScheduleVo> getMonthScheduleDataList(ScheduleVo scheduleVo) {
		List<ScheduleVo> list =  scheduleService.getMonthScheduleDataList(scheduleVo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/company/getDateScheduleDataList", method=RequestMethod.POST)
	public List<ScheduleVo> getDateScheduleDataList(ScheduleVo scheduleVo) {
		List<ScheduleVo> list =  scheduleService.getDateScheduleDataList(scheduleVo);
		System.out.println("ScheduleController, getDateScheduleDataList, scheduleVo : " + scheduleVo);
		System.out.println("ScheduleController, getDateScheduleDataList, list : " + list);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/company/scheduleRegistRun", method=RequestMethod.POST)
	public String scheduleRegistRun(ScheduleVo scheduleVo) {
		System.out.println("ScheduleController, scheduleRegistRun, scheduleVo : " + scheduleVo);
		scheduleService.scheduleRegistRun(scheduleVo);
		//userid, content, syear, sdate, smonth
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value = "/company/scheduleDeleteRun/{sno}", method=RequestMethod.POST)
	public String scheduleDeleteRun(@PathVariable int sno) {
		System.out.println("ScheduleControllet, scheduleDeleteRun, sno : " + sno);
		scheduleService.scheduleDeleteRun(sno);
		return "success";
	}
	
	
}
