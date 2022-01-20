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
	
	public void memberManageRun(MemberVo memberVo) {
		memberDao.memberManageRun(memberVo);
	}
	
	public MemberVo getMemberData(String userid) {
		MemberVo memberVo = memberDao.getMemberData(userid);
		return memberVo;
	}
	
	public void myDataModifyRun(MemberVo memberVo) {
		memberDao.myDataModifyRun(memberVo);
	}
	

	public List<MemberVo> listMember() {
		return memberDao.listMember();
	}
	
	public List<MemberVo> searchDepartment(String department) {
		List<MemberVo> list = memberDao.searchDepartment(department);
		return list;
	}

	public List<MemberVo> memberManageList() {
		List<MemberVo> list = memberDao.memberManageList();
		return list;
	}
	
	public List<MemberVo> searchMember(MemberVo memberVo){
		List<MemberVo> list = memberDao.searchMember(memberVo);
		return list;
	}
	
	public int mainApproveCount() {
		int count = memberDao.mainApproveCount();
		return count;
	}
	
}
