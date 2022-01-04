package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.FranApplyVo;

@Repository
public class StoreDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.kh.ex01.mappers.applyfran.";
	
	public void applyRegistRun(FranApplyVo franApplyVo) {
		sqlSession.insert(NAMESPACE + "applyRegistRun", franApplyVo);
	}
	
	public FranApplyVo applyInquiry(String email) {
		FranApplyVo franApplyVo = sqlSession.selectOne(NAMESPACE + "applyInquiry", email);
		return franApplyVo;
	}
	
	public int checkApply(String email) {
		System.out.println("StoreDao, checkApply, email : " + email);
		int result = sqlSession.selectOne(NAMESPACE + "checkApply", email);
		System.out.println("StoreDao, checkApply, result : " + result);
		
		return result;
	}
	
	public List<FranApplyVo> applyFranList() {
		List<FranApplyVo> list = sqlSession.selectList(NAMESPACE + "applyFranList");
		return list;
		
	}

}
