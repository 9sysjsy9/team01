package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.HireBoardVo;
import com.kh.ex01.vo.HireVo;
import com.kh.ex01.vo.PagingDto;



@Repository
public class HireDao {
		
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.kh.ex01.mappers.hire.";
	
	public List<HireBoardVo> listAll(PagingDto pagingDto) {
		List<HireBoardVo> list = sqlSession.selectList(NAMESPACE + "listAll", pagingDto);
		return list;
	}
	
	public List<HireBoardVo> listNew() {
		List<HireBoardVo> list = sqlSession.selectList(NAMESPACE + "listNew");
		return list;
	}
	
	public List<HireBoardVo> listExperience() {
		List<HireBoardVo> list = sqlSession.selectList(NAMESPACE + "listExperience");
		return list;
	}
	
	public List<HireBoardVo> listIntern() {
		List<HireBoardVo> list = sqlSession.selectList(NAMESPACE + "listIntern");
		return list;
	}
	
	public int getCount() {
		int count = sqlSession.selectOne(NAMESPACE+"getCount");
		return count;
	}
	
	public List<HireVo> registList() {
		List<HireVo> list = sqlSession.selectList(NAMESPACE + "registList");
		return list;
	}
	
	public void registRun(HireVo hireVo) {
		sqlSession.insert(NAMESPACE + "registRun", hireVo);
	}
	
	public HireVo getBoard(int hno) {
		HireVo hireVo = sqlSession.selectOne(NAMESPACE + "getBoard",hno);
		return hireVo;
	}
	
}