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
	
	public void applyModifyRun(FranApplyVo franApplyVo) {
		sqlSession.update(NAMESPACE + "applyModifyRun",franApplyVo);
	}
	
	public FranApplyVo applyStateInquiry(String email) {
		FranApplyVo franApplyVo = sqlSession.selectOne(NAMESPACE + "applyStateInquiry", email);
		return franApplyVo;
	}
	
	public int checkApply(String email) {
		System.out.println("StoreDao, checkApply, email : " + email);
		int result = sqlSession.selectOne(NAMESPACE + "checkApply", email);
		System.out.println("StoreDao, checkApply, result : " + result);
		
		return result;
	}
	
//사내페이지
	
	public List<FranApplyVo> applyFranList(FranApplyVo franApplyVo) {
		List<FranApplyVo> list = sqlSession.selectList(NAMESPACE + "applyFranList", franApplyVo);
		return list;
		
	}
	
	public FranApplyVo applyInquiry(String fno) {
		FranApplyVo franApplyVo = sqlSession.selectOne(NAMESPACE + "applyInquiry", fno);
		return franApplyVo;
	}
	
	public void replyRegistRun(FranApplyVo franApplyVo) {
		sqlSession.update(NAMESPACE + "replyRegistRun",franApplyVo);
	}
	
	public int mainApplyCount() {
		int count = sqlSession.selectOne(NAMESPACE + "mainApplyCount");
		return count;
	}
}
