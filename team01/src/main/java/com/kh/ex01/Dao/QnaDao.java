package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.QnaVo;

@Repository
public class QnaDao {
	@Inject
	SqlSession sqlSession;
	
	private static final String NAMESAPCE = "com.kh.ex01.mappers.qna.";
	
	public List<QnaVo> selectAll() {
		List<QnaVo> list = sqlSession.selectList(NAMESAPCE+"selectAll");
		return list;
	}
	 //
	
}
