package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.BoardService;
import com.kh.ex01.service.MemberService;
import com.kh.ex01.service.MessageService;
import com.kh.ex01.service.StoreService;
import com.kh.ex01.vo.BoardVo;
import com.kh.ex01.vo.MemberVo;

@Controller
@RequestMapping("/company")
public class CompanyController {
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private StoreService storeService;
	
	@Inject
	private MessageService messageService;
	
	@Inject
	private MemberService memberService;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVo loginData = (MemberVo)session.getAttribute("loginData");
		if(loginData != null) {
			String loginId = loginData.getUserid();
			
			List<BoardVo> noticeBoardList = boardService.mainBoardList("n");
			List<BoardVo> freeBoardList = boardService.mainBoardList("f");
			List<BoardVo> anonBoardList = boardService.mainBoardList("a");
			List<BoardVo> pdsBoardList = boardService.mainBoardList("p");
			model.addAttribute("noticeBoardList", noticeBoardList);
			model.addAttribute("freeBoardList", freeBoardList);
			model.addAttribute("anonBoardList", anonBoardList);
			model.addAttribute("pdsBoardList", pdsBoardList);
			
			int applyCount = storeService.mainApplyCount();
			System.out.println("applyCount : " + applyCount);
			model.addAttribute("applyCount", applyCount);
			
			int messageCount = messageService.mainMessageCount(loginId);
			model.addAttribute("messageCount", messageCount);
			
			int memberApproveCount = memberService.mainApproveCount();
			model.addAttribute("memberApproveCount", memberApproveCount);
		}
		return "/company/main";
	}

}
