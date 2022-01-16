package com.kh.ex01.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.ScheduleVo;

@Repository
public class ScheduleDao {
	
	private final static String NAMESPACE = "com.kh.ex01.mappers.schedule.";
	
	@Inject
	private SqlSession sqlSession;
	
	public List<ScheduleVo> scheduleDataList(int syear, int smonth) {
		Map<String, Integer> map = new HashMap<>();
		map.put("syear", syear);
		map.put("smonth", smonth);
	    System.out.println("ScheduleDao, scheduleDataList, map : " + map );
		List<ScheduleVo> list = sqlSession.selectList(NAMESPACE + "scheduleDataList", map);
		System.out.println("ScheduleDao, scheduleDataList, list : " + list );
		return list;
	}

}
