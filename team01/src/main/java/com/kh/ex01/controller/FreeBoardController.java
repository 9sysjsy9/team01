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
import com.kh.ex01.vo.PagingDto;

@Controller
@RequestMapping("/company")
public class FreeBoardController {
	
	@Inject
	private FreeBoardService freeboardService;
	
	// 자유게시판 목록
	@RequestMapping(value = "/board/free/free_list", method = RequestMethod.GET)
	 public String freeList(Model model,PagingDto pagingDto) {
		 pagingDto.setCount(freeboardService.getCount());
		 pagingDto.setPage(pagingDto.getPage());
		 List<BoardVo> list = freeboardService.freeList(pagingDto);
		 model.addAttribute("list",list);
		 model.addAttribute("pagingDto", pagingDto);
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
		 System.out.println("컨트롤" + boardVo);
		 BoardVo boardMoveVo = freeboardService.menuMove(bno); // 게시글 이동
		 model.addAttribute("boardMoveVo",boardMoveVo);
		 model.addAttribute("boardVo",boardVo);
		 return "/company/board/free/free_content";
	 }
	
	// 자유게시판 글추가
	@RequestMapping(value="/board/free/regist_run", method=RequestMethod.GET)
	public String boardRegistRun(BoardVo boardVo) {
		System.out.println("BoardController, boardRegistRun, boardVo:" + boardVo);
		freeboardService.insertBoard(boardVo);
		return "redirect:/company/board/free/free_list";
	}
	
	// 자유게시판 글 삭제
	@RequestMapping(value="/board/free/free_delete", method=RequestMethod.GET)
	public String deleteBoard(int bno) {
		freeboardService.deleteBoard(bno);
		return "redirect:/company/board/free/free_list";
	}
	
	// 자유게시판 글 수정 
	@RequestMapping(value="/board/free/free_modify_run", method=RequestMethod.GET)
	public String modifyBoard(BoardVo boardVo) {
		freeboardService.modifyBoard(boardVo);
		return "redirect:/company/board/free/free_content?bno="+ boardVo.getBno() + 
				"&title=" + boardVo.getTitle() + "&content=" + boardVo.getContent();
	}
	
	// 자유게시판 글 수정 폼
	@RequestMapping(value="/board/free/free_modify", method=RequestMethod.GET)
	public String searchByBno(Model model, int bno) {
		BoardVo boardVo = freeboardService.getBoard(bno);
		model.addAttribute("boardVo",boardVo);
		return "/company/board/free/free_modify";
	}
}
