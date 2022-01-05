package com.kh.ex01.Dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.MemberVo;

@Repository
public class MemberDao {

	private static final String NAMESPACE = "com.kh.ex01.mappers.member.";

	@Inject
	private SqlSession sqlSession;

	public MemberVo loginRun(String userid, String userpw) {
		Map<String, String> loginInfo = new HashMap<>();
		loginInfo.put("userid", userid);
		loginInfo.put("userpw", userpw);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "loginRun", loginInfo);
		return memberVo;
	}
}
