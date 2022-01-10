package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ex01.service.FreeBoardService;
import com.kh.ex01.vo.BoardVo;
import com.kh.ex01.vo.HireBoardVo;

@Controller
@RequestMapping("/company")
public class FreeBoardController {
	
	@Inject
	private FreeBoardService freeboardService;
	
	// 자유게시판 목록
	@RequestMapping(value = "/board/free/free_list", method = RequestMethod.GET)
	 public String freeList(Model model) {
		 List<BoardVo> list = freeboardService.freeList();
		 model.addAttribute("list",list);
		 System.out.println("list:"+list);
		 return "/company/board/free/free_list";
	 }
	
	// 자유게시판 등록
	@RequestMapping(value = "/board/free/free_regist", method = RequestMethod.GET)
	public String freeRegist() {
		return "/company/board/free/free_regist";
	}
	
	// 자유게시판 글 상세보기
	@RequestMapping(value = "/board/free/free_content", method = RequestMethod.GET)
	 public String registBoard(Model model, int bno) {
		 BoardVo boardVo = freeboardService.getBoard(bno);
		 BoardVo boardMoveVo = freeboardService.menuMove(bno); // 게시글 이동
		 model.addAttribute("boardMoveVo",boardMoveVo);
		 model.addAttribute("boardVo",boardVo);
		 return "/company/board/free/free_content";
	 }
	
	// 자유게시판 글추가
	@RequestMapping(value="/board/free/regist_run", method=RequestMethod.GET)
	public String boardRegistRun(BoardVo boardVo) {
		System.out.println("BoardController, boardRegistRun, boardVo:" + boardVo);
//		freeboardService.insertBoard(boardVo);
		return "redirect:/company/board/free/free_list";
	}
	
	// 자유게시판 글 삭제
	@RequestMapping(value="/board/free/free_delete", method=RequestMethod.GET)
	public String deleteBoard(int bno) {
		freeboardService.deleteBoard(bno);
		return "redirect:/company/board/free/free_list";
	}
	
}
