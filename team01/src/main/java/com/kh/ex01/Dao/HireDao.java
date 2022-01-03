package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.HireVo;



@Repository
public class HireDao {
		
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.kh.ex01.mappers.hire.";
	
	public List<HireVo> listAll() {
		List<HireVo> list = sqlSession.selectList(NAMESPACE + "listAll");
		return list;
	}
	
	public List<HireVo> listNew() {
		List<HireVo> list = sqlSession.selectList(NAMESPACE + "listNew");
		return list;
	}
	
	public List<HireVo> listExperience() {
		List<HireVo> list = sqlSession.selectList(NAMESPACE + "listExperience");
		return list;
	}
	
	public List<HireVo> listIntern() {
		List<HireVo> list = sqlSession.selectList(NAMESPACE + "listIntern");
		return list;
	}
}