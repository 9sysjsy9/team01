package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.AskProductVo;

@Repository
public class AskProductDao {
	@Inject
	SqlSession sqlSession;
	
	private static final String NAMESAPCE = "com.kh.ex01.mappers.askproduct.";
	
	public List<AskProductVo> selectAll() {
		List<AskProductVo> list = sqlSession.selectList(NAMESAPCE+"selectAll");
		return list;
	}
}
