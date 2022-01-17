package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.ScheduleDao;
import com.kh.ex01.vo.ScheduleVo;

@Service
public class ScheduleService {
	
	@Inject
	private ScheduleDao scheduleDao;
	
	public List<ScheduleVo> getMonthScheduleDataList(ScheduleVo scheduleVo){
		List<ScheduleVo> list =  scheduleDao.getMonthScheduleDataList(scheduleVo);
		return list;
	}
	
	public List<ScheduleVo> getDateScheduleDataList(ScheduleVo scheduleVo){
		List<ScheduleVo> list =  scheduleDao.getDateScheduleDataList(scheduleVo);
		return list;
	}
	

}
