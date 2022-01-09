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
		 BoardVo boardVo2 = freeboardService.menuMove2(bno);
//		 BoardVo boardMoveVo = freeboardService.menuMove(bno); // 게시글 이동
//		 System.out.println("컨텐츠 무브 Vo:"+boardMoveVo);
//		 System.out.println("컨텐츠 보드 Vo:"+boardVo);
		 System.out.println("컨텐츠 보드 boardVo2:"+boardVo2);
//		 model.addAttribute("boardMoveVo",boardMoveVo);
//		 model.addAttribute("boardVo2", boardVo2);
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
	
//	@RequestMapping(value="/referenceRoom", method=RequestMethod.GET)
//	   public String referenceRoom(Model model, int rno) {
//	      ReferenceVo referenceVo = lookJobService.getReference(rno);
//	      ReferenceVo pageVo = lookJobService.pageMove(rno);
//	      List<ReferenceVo> data = lookJobService.referenceImage(rno);
//	      System.out.println(pageVo);
//	      model.addAttribute("data", data);
//	      model.addAttribute("pageVo", pageVo);
//	      model.addAttribute("referenceVo", referenceVo);
//	      return "employ/referenceRoom";
//	   }
	
}
