package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.customer.FaqVo;

@Repository
public class FaqDao {
	@Inject
	SqlSession sqlSession;
	
	private static final String NAMESAPCE = "com.kh.ex01.mappers.faq.";
	
	public List<FaqVo> selectAll() {
		List<FaqVo> list = sqlSession.selectList(NAMESAPCE+"selectAll");
		return list;
	}
	
	
}
