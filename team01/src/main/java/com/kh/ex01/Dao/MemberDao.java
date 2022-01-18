package com.kh.ex01.Dao;

import java.util.HashMap;
import java.util.List;
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
	
	public int checkId(String userid) {
		int result = sqlSession.selectOne(NAMESPACE + "checkId", userid);
		return result;
	}
	
	public int checkEno(int eno) {
		int result = sqlSession.selectOne(NAMESPACE + "checkEno", eno);
		return result;
	}
	
	public void registRun(MemberVo memberVo) {
		sqlSession.insert(NAMESPACE + "registRun", memberVo);
	}
	
	public List<MemberVo> memberApproveList(){
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "memberApproveList");
		return list;
	}
	
	public void memberApproveRun(MemberVo memberVo) {
		sqlSession.update(NAMESPACE + "memberApproveRun", memberVo);
	}
	
	public MemberVo getMemberData(String userid) {
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "getMemberData", userid);
		return memberVo;
	}
	
	public void myDataModifyRun(MemberVo memberVo) {
		sqlSession.update(NAMESPACE + "myDataModifyRun", memberVo);
	}
	

	public List<MemberVo> listMember() {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "listmember");
		return list;
	}
	
	public List<MemberVo> searchDepartment(String department){
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "searchDepartment",department);
		return list;
	}

	public List<MemberVo> memberManageList() {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "memberManageList");
		return list;
	}
	
	public List<MemberVo> searchMember(MemberVo memberVo){
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "searchMember", memberVo);
		System.out.println("다오:" + list);
		return list;
	}

}
