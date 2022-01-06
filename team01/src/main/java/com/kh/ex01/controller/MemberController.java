package com.kh.ex01.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ex01.service.MemberService;
import com.kh.ex01.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	private MemberService memberService;;
	
	@RequestMapping(value = "/loginRun", method=RequestMethod.POST)
	public String loginRun(String userid, String userpw, HttpServletRequest request, RedirectAttributes rttr) {
		MemberVo memberVo = memberService.loginRun(userid, userpw);
		System.out.println("Userid : " + userid +", Userpw : " + userpw);
		System.out.println("memberVo : " + memberVo);
		
		if(memberVo == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/company/login";
		}
		
		HttpSession session = request.getSession();
		MemberVo sendVoData = new MemberVo(); //세션에는 아이디, 이름, 권한, 직급, 부서, 사번 정보만 전달
		sendVoData.setAuthority(memberVo.getAuthority());
		sendVoData.setUserid(memberVo.getUserid());
		sendVoData.setUsername(memberVo.getUsername());
		sendVoData.setPosition(memberVo.getPosition());
		sendVoData.setDepartment(memberVo.getDepartment());
		sendVoData.setEno(memberVo.getEno());
		session.setAttribute("memberVo", sendVoData);
		
		return "/company/main";
	}
	
}
