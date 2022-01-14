package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.CommentService;
import com.kh.ex01.service.BoardService;
import com.kh.ex01.vo.BoardVo;
import com.kh.ex01.vo.CommentVo;
import com.kh.ex01.vo.HireBoardVo;
import com.kh.ex01.vo.PagingDto;

@Controller
@RequestMapping("/company")
public class BoardController {
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private CommentService commentService;
	
	// 자유게시판 목록
	@RequestMapping(value = "/board/free/free_list", method = RequestMethod.GET)
	 public String freeList(Model model,PagingDto pagingDto) {
		 pagingDto.setCount(boardService.getCount());
		 pagingDto.setPage(pagingDto.getPage());
		 List<BoardVo> list = boardService.freeList(pagingDto);
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
		 BoardVo boardVo = boardService.getBoard(bno);
		 BoardVo boardMoveVo = boardService.menuMove(bno); // 게시글 이동
		 List<CommentVo> list = commentService.commentList(bno); // 덧글 리스트
		 model.addAttribute("boardMoveVo",boardMoveVo);
		 model.addAttribute("boardVo",boardVo);
		 model.addAttribute("list",list);
		 return "/company/board/free/free_content";
	 }
	
	// 자유게시판 글추가
	@RequestMapping(value="/board/free/regist_run", method=RequestMethod.GET)
	public String boardRegistRun(BoardVo boardVo) {
		System.out.println("BoardController, boardRegistRun, boardVo:" + boardVo);
		boardService.insertBoard(boardVo);
		return "redirect:/company/board/free/free_list";
	}
	
	// 자유게시판 글 삭제
	@RequestMapping(value="/board/free/free_delete", method=RequestMethod.GET)
	public String deleteBoard(int bno) {
		commentService.deleteCommentBoard(bno);
		boardService.deleteBoard(bno);
		return "redirect:/company/board/free/free_list";
	}
	
	// 자유게시판 글 수정 
	@RequestMapping(value="/board/free/free_modify_run", method=RequestMethod.GET)
	public String modifyBoard(BoardVo boardVo) {
		boardService.modifyBoard(boardVo);
		return "redirect:/company/board/free/free_content?bno="+ boardVo.getBno() + 
				"&title=" + boardVo.getTitle() + "&content=" + boardVo.getContent();
	}
	
	// 자유게시판 글 수정 폼
	@RequestMapping(value="/board/free/free_modify", method=RequestMethod.GET)
	public String searchByBno(Model model, int bno) {
		BoardVo boardVo = boardService.getBoard(bno);
		model.addAttribute("boardVo",boardVo);
		return "/company/board/free/free_modify";
	}
	
	// 채용공고 글 등록폼
	@RequestMapping(value="/hire/regist_board", method=RequestMethod.GET)
	public String hireBoardResgist() {
		return "/company/hire/regist_board";
	}
	
	// 채용공고 등록
	@RequestMapping(value="/hire/regist_board_run", method=RequestMethod.GET)
	public String hireBoardResgistRun(HireBoardVo hireBoardVo) {
		boardService.insertHireBoard(hireBoardVo);
		return "redirect:/hire/company/regist_list";
	}
}
