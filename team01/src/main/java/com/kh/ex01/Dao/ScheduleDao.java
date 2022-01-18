package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.ScheduleVo;

@Repository
public class ScheduleDao {
	
	private static final String NAMESPACE = "com.kh.ex01.mappers.schedule.";
	
	@Inject
	private SqlSession sqlSession;
	
	public List<ScheduleVo> getMonthScheduleDataList(ScheduleVo scheduleVo) {
		List<ScheduleVo> list = sqlSession.selectList(NAMESPACE + "getMonthScheduleDataList", scheduleVo);
		return list;
		
	}
	
	public List<ScheduleVo> getDateScheduleDataList(ScheduleVo scheduleVo) {
		System.out.println("ScheduleDao, getDateScheduleDataList, scheduleVo :" + scheduleVo);
		List<ScheduleVo> list = sqlSession.selectList(NAMESPACE + "getDateScheduleDataList", scheduleVo);
		return list;
		
	}
	
	public ScheduleVo getDateScheduleData(int sno) {
		ScheduleVo scheduleVo = sqlSession.selectOne(NAMESPACE + "getDateScheduleData", sno);
		return scheduleVo;
	}
	
	public void scheduleRegistRun(ScheduleVo scheduleVo) {
		sqlSession.insert(NAMESPACE + "scheduleRegistRun" , scheduleVo);
	}
	
	public void scheduleModifyRun(ScheduleVo scheduleVo) {
		sqlSession.update(NAMESPACE + "scheduleModifyRun", scheduleVo);
	}
	
	public void scheduleDeleteRun(int sno) {
		System.out.println("ScheduleDao, scheduleDeleteRun, sno :" + sno);
		sqlSession.delete(NAMESPACE + "scheduleDeleteRun", sno);
	}
	
	

}
