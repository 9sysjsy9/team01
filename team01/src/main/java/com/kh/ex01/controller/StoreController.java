package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ex01.service.StoreService;
import com.kh.ex01.vo.FranApplyVo;

@Controller
@RequestMapping(value = "/store")
public class StoreController {
	
//	기능 담당자 : 고만재

	@Inject
	private StoreService storeService;

	// 매장 찾기 페이지
	@RequestMapping(value = "/findStore")
	public String findStore() {
		return "/store/findStore";
	}

	// 가맹 문의 페이지
	@RequestMapping(value = "/applyFranchise")
	public String applyFranchise() {
		return "/store/applyFranchise";
	}

	//지원서 유무 조회
	@ResponseBody
	@RequestMapping(value = "/checkApply", method = RequestMethod.POST)
	public String checkInquiry(String email) {
//		System.out.println("StoreController, checkApply, email : " + email);
		int result = storeService.checkApply(email);
		if (result > 0) {
			return "impossible";
		} else {
			return "possible";
		}
	}

	// 가맹점 문의서 제출
	@RequestMapping(value = "/applyRegistRun")
	public String applyRegistRun(FranApplyVo franApplyVo, RedirectAttributes rttr) {
//		System.out.println("StoreController, applyRegistRun, franApplyVo : " + franApplyVo);
		storeService.applyRegistRun(franApplyVo);
		rttr.addFlashAttribute("msg", "regSuccess");
		return "redirect:/store/applyFranchise";
	}

	// 가맹점 문의서 조회
	@ResponseBody
	@RequestMapping(value = "/applyStateInquiry", method = RequestMethod.POST)
	public FranApplyVo applyStateInquiry(String email) {
//		System.out.println("StoreController, applyInquiry, email : " + email);
		FranApplyVo franApplyVo = storeService.applyStateInquiry(email);
//		System.out.println("StoreController, applyInquiry, franApplyVo : " + franApplyVo);
		if (franApplyVo != null) {
			return franApplyVo;
		} else {
			return null;
		}
	}
	
	//문의 내용 수정
	@RequestMapping(value = "/applyModifyRun", method = RequestMethod.POST)
	public String applyModifyRun(FranApplyVo franApplyVo, RedirectAttributes rttr) {
//		System.out.println("StoreController, applyModifyRun, franApplyVo : " + franApplyVo);
		storeService.applyModifyRun(franApplyVo);
		rttr.addFlashAttribute("msg", "modSuccess");
		return "redirect:/store/applyFranchise";
	}
	
	//가맹점 문의 리스트
	@RequestMapping(value = "/company/applyFranList", method = RequestMethod.GET)
	public String applyFranList(Model model, FranApplyVo franApplyVo) {
		List<FranApplyVo> list = storeService.applyFranList(franApplyVo);
		model.addAttribute("applyList", list);
		return "/company/store/applyFranList";
	}
	
	//가맹점 문의 내용
	@ResponseBody
	@RequestMapping(value = "/company/applyInquiry", method = RequestMethod.POST)
	public FranApplyVo applyInquiry(String fno) {
		FranApplyVo franApplyVo = storeService.applyInquiry(fno);
		return franApplyVo;
	}
	
	//가맹점 문의 답변
	@RequestMapping(value="/company/replyRegistRun", method = RequestMethod.POST)
	public String replyRegistRun(FranApplyVo franApplyVo) {
//		System.out.println("StoreController, applyRegistRun, franApplyVo : " + franApplyVo);
		storeService.replyRegistRun(franApplyVo);
		return "redirect:/store/company/applyFranList?replyState=a";
	}
}
