package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.BoardService;
import com.kh.ex01.vo.BoardVo;

@Controller
@RequestMapping("/company")
public class CompanyController {
	
	@Inject
	private BoardService boardService;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPage(Model model) {
		List<BoardVo> noticeBoardList = boardService.mainBoardList("n");
		List<BoardVo> freeBoardList = boardService.mainBoardList("f");
		List<BoardVo> anonBoardList = boardService.mainBoardList("a");
		List<BoardVo> pdsBoardList = boardService.mainBoardList("p");
		
		model.addAttribute("noticeBoardList", noticeBoardList);
		model.addAttribute("freeBoardList", freeBoardList);
		model.addAttribute("anonBoardList", anonBoardList);
		model.addAttribute("pdsBoardList", pdsBoardList);
		
		return "/company/main";
	}

}
