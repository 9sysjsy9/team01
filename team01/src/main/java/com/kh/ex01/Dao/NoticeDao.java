package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.NoticeVo;

@Repository
public class NoticeDao {
	@Inject
	SqlSession sqlSession;
	
	private static final String NAMESAPCE = "com.kh.ex01.mappers.customer.";
	
	public List<NoticeVo> selectAll() {
		List<NoticeVo> list = sqlSession.selectList(NAMESAPCE + "selectAll" );
		return list;
	}
	
	
}
