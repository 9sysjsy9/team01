package com.kh.ex01.service;

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
	
}
