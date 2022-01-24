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
	
	// 기능 담당자 : 고만재
	
	@Inject
	private ScheduleService scheduleService;

//회사일정 페이지
	@RequestMapping(value = "/company/scheduleCalendar")
	public String scheduleCalendar() {
		return "/company/schedule/scheduleCalendar";
	}
	
//회사일정 월 데이터
	@ResponseBody
	@RequestMapping(value = "/company/getMonthScheduleDataList", method=RequestMethod.POST)
	public List<ScheduleVo> getMonthScheduleDataList(ScheduleVo scheduleVo) {
		List<ScheduleVo> list =  scheduleService.getMonthScheduleDataList(scheduleVo);
		return list;
	}
	
//회사일정 일 데이터
	@ResponseBody
	@RequestMapping(value = "/company/getDateScheduleDataList", method=RequestMethod.POST)
	public List<ScheduleVo> getDateScheduleDataList(ScheduleVo scheduleVo) {
		List<ScheduleVo> list =  scheduleService.getDateScheduleDataList(scheduleVo);
//		System.out.println("ScheduleController, getDateScheduleDataList, scheduleVo : " + scheduleVo);
//		System.out.println("ScheduleController, getDateScheduleDataList, list : " + list);
		return list;
	}
	
//회사일정 단위 단위데이터
	@ResponseBody
	@RequestMapping(value = "/company/getDateScheduleData/{sno}", method=RequestMethod.POST)
	public ScheduleVo getDateScheduleData(@PathVariable int sno) {
		System.out.println("ScheduleControllet, getDateScheduleData, sno : " + sno);
		ScheduleVo scheduleVo = scheduleService.getDateScheduleData(sno);
		return scheduleVo;
	}
	
//회사일정 등록
	@ResponseBody
	@RequestMapping(value = "/company/scheduleRegistRun", method=RequestMethod.POST)
	public String scheduleRegistRun(ScheduleVo scheduleVo) {
		System.out.println("ScheduleController, scheduleRegistRun, scheduleVo : " + scheduleVo);
		scheduleService.scheduleRegistRun(scheduleVo);
		//userid, content, syear, sdate, smonth
		return "success";
	}
	
//회사일정 수정
	@ResponseBody
	@RequestMapping(value = "/company/scheduleModifyRun", method=RequestMethod.POST)
	public String scheduleModifyRun(ScheduleVo scheduleVo) {
		System.out.println("ScheduleController, scheduleModifyRun, scheduleVo : " + scheduleVo);
		scheduleService.scheduleModifyRun(scheduleVo);
		return "success";
	}
	
//회사일정 삭제
	@ResponseBody
	@RequestMapping(value = "/company/scheduleDeleteRun/{sno}", method=RequestMethod.POST)
	public String scheduleDeleteRun(@PathVariable int sno) {
		System.out.println("ScheduleControllet, scheduleDeleteRun, sno : " + sno);
		scheduleService.scheduleDeleteRun(sno);
		return "success";
	}
	
}
