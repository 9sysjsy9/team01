package com.kh.ex01.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ex01.service.MemberService;
import com.kh.ex01.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService memberService;

	@RequestMapping("/login")
	public String login() {
		return "/company/member/login";
	}

	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String userid, String userpw, HttpServletRequest request, RedirectAttributes rttr) {
		MemberVo memberVo = memberService.loginRun(userid, userpw);
		System.out.println("MemberController, loginRun, Userid : " + userid + ", Userpw : " + userpw);
		System.out.println("MemberController, loginRun, memberVo : " + memberVo);

		if (memberVo == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/member/login";
		} else if (memberVo.getAuthority() == 0) {
			rttr.addFlashAttribute("msg", "waitingApprove");
			return "redirect:/member/login";
		}

		HttpSession session = request.getSession();
		MemberVo sendVoData = new MemberVo(); // 세션에는 아이디, 이름, 권한, 직급, 부서, 사번 정보만 전달
		sendVoData.setAuthority(memberVo.getAuthority());
		sendVoData.setUserid(memberVo.getUserid());
		sendVoData.setUsername(memberVo.getUsername());
		sendVoData.setPosition(memberVo.getPosition());
		sendVoData.setDepartment(memberVo.getDepartment());
		sendVoData.setEno(memberVo.getEno());
		session.setAttribute("loginData", sendVoData);

		return "/company/main";
	}

	@RequestMapping(value = "/registForm")
	public String registForm() {
		return "/company/member/memberRegistForm";
	}

	@ResponseBody
	@RequestMapping(value = "/checkState", method = RequestMethod.POST)
	public Map<String, Integer> chekcState(String userid, int eno) {
		int checkId = 0;
		int checkEno = 0;
		checkId = memberService.checkId(userid); // 1 중복 0 비중복
		checkEno = memberService.checkEno(eno); // 1중복 0 비중복
		System.out.println("userid : " + userid +",eno :"+eno);
		System.out.println("checkId : " + checkId +",chedkEno :"+checkEno);
		Map<String, Integer> result = new HashMap<>();
		result.put("checkId", checkId);
		result.put("checkEno", checkEno);
		return result;
	}
	
	@RequestMapping(value = "/registRun", method = RequestMethod.POST)
	public String registRun(MemberVo memberVo, RedirectAttributes rttr) {
		System.out.println("MemberController, registRun, memberVo : " +memberVo);
		memberService.registRun(memberVo);
		rttr.addFlashAttribute("msg", "registSuccess");
		return "redirect:/member/login";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, RedirectAttributes rttr) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginData");
		rttr.addFlashAttribute("msg", "logout");
		return "redirect:/member/login";
	}
	
	@RequestMapping(value = "/company/memberApproveList")
	public String memberApproveList(Model model) {
		List<MemberVo> list = memberService.memberApproveList();
		model.addAttribute("approveList", list);
		return "/company/member/memberApproveList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/company/memberApproveRun")
	public String memberApproveRun(MemberVo memberVo) {
		System.out.println("MemberControler, memberApproveRun, memberVo : " + memberVo);
		memberService.memberApproveRun(memberVo);
		return "success";
	}
	
	@RequestMapping(value = "/company/myPage")
	public String myPage(MemberVo memberVo) {
		return "/company/member/mypage";
	}
	
}
