package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.PagingDto;

@Repository
public class AskProductDao {
	@Inject
	SqlSession sqlSession;
	
	private static final String NAMESAPCE = "com.kh.ex01.mappers.askproduct.";
	
	public List<AskProductVo> selectAll(PagingDto pt) {
		List<AskProductVo> list = sqlSession.selectList(NAMESAPCE+"selectAll", pt);
		return list;
	}
	public AskProductVo getContent(int ano) {
		AskProductVo askProductVo = sqlSession.selectOne(NAMESAPCE+"getContent", ano);
		return askProductVo;
	}
	public int getCount() {
		int count = sqlSession.selectOne(NAMESAPCE+"getCount");
		return count;
	}
	public void modifyContent(AskProductVo askProductVo) {
		sqlSession.update(NAMESAPCE+"modifyContent", askProductVo);
	}
	public void insertContent(AskProductVo askProductVo) {
		sqlSession.insert(NAMESAPCE+"insertContent", askProductVo);
	}
	public void deleteContent(int ano) {
		sqlSession.delete(NAMESAPCE+"deleteContent", ano);
	}
	
	
}
