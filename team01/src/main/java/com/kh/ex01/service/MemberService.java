package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.MemberDao;
import com.kh.ex01.vo.MemberVo;

@Service
public class MemberService {
	
	@Inject
	private MemberDao memberDao;
	
	public MemberVo loginRun(String userid, String userpw) {
		MemberVo memberVo = memberDao.loginRun(userid, userpw);
		return memberVo;
	}
	
	public int checkId(String userid) {
		int result = memberDao.checkId(userid);
		return result;
	}
	
	public int checkEno(int eno) {
		int result = memberDao.checkEno(eno);
		return result;
	}
	
	public void registRun(MemberVo memberVo) {
		memberDao.registRun(memberVo);
	}
	
	public List<MemberVo> memberApproveList(){
		List<MemberVo> list = memberDao.memberApproveList();
		return list;
	}
	
	public void memberApproveRun(MemberVo memberVo) {
		memberDao.memberApproveRun(memberVo);
	}
	
	public MemberVo getMemberData(String userid) {
		MemberVo memberVo = memberDao.getMemberData(userid);
		return memberVo;
	}
	
	public void myDataModifyRun(MemberVo memberVo) {
		memberDao.myDataModifyRun(memberVo);
	}
	
}
