package com.kh.ex01.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<HireBoardVo> listNew(PagingDto pagingDto) {
		List<HireBoardVo> list = sqlSession.selectList(NAMESPACE + "listNew", pagingDto);
		return list;
	}
	
	public List<HireBoardVo> listExperience(PagingDto pagingDto) {
		List<HireBoardVo> list = sqlSession.selectList(NAMESPACE + "listExperience", pagingDto);
		return list;
	}
	
	public List<HireBoardVo> listIntern(PagingDto pagingDto) {
		List<HireBoardVo> list = sqlSession.selectList(NAMESPACE + "listIntern", pagingDto);
		return list;
	}
	
	public int getCount() {
		int count = sqlSession.selectOne(NAMESPACE+"getCount");
		return count;
	}
	
	public int getN_Count() {
		int count = sqlSession.selectOne(NAMESPACE+"getN_Count");
		return count;
	}
	
	public int getI_Count() {
		int count = sqlSession.selectOne(NAMESPACE+"getI_Count");
		return count;
	}
	
	public int getE_Count() {
		int count = sqlSession.selectOne(NAMESPACE+"getE_Count");
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
	
	public void deleteBoard(int hno) {
		sqlSession.delete(NAMESPACE + "deleteBoard", hno);
	}
	
	public void modifySuccess(int hno) {
		sqlSession.update(NAMESPACE + "modifySuccess", hno);
	}
	
	public void modifyFail(int hno) {
		sqlSession.update(NAMESPACE + "modifyFail", hno);
	}
	
	public HireVo searchSuccess(String name, String email) {
		Map<String, String> map = new HashMap<>();
		map.put("name",name);
		map.put("email",email);
		System.out.println("map : " + map);
		HireVo hireVo = sqlSession.selectOne(NAMESPACE + "searchSuccess", map);
		return hireVo;
	}
	
}