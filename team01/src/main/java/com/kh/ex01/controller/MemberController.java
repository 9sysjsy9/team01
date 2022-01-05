package com.kh.ex01.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.kh.ex01.service.MemberService;
import com.kh.ex01.vo.MemberVo;

@Controller
public class MemberController {
	
	@Inject
	private MemberService memberService;;
	
	public MemberVo loginRun(String userid, String userpw) {
		MemberVo memberVo = memberService.loginRun(userid, userpw);
		return memberVo;
	}
	
}
