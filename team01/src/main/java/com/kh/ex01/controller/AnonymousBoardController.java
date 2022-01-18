package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ex01.service.CommentService;
import com.kh.ex01.service.BoardService;
import com.kh.ex01.vo.BoardVo;
import com.kh.ex01.vo.CommentVo;
import com.kh.ex01.vo.HireBoardVo;
import com.kh.ex01.vo.PagingDto;

@Controller
@RequestMapping("/company")
public class AnonymousBoardController {
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private CommentService commentService;
	
	
	// 익명게시판 목록
	@RequestMapping(value = "/board/anonymous/anonymous_list", method = RequestMethod.GET)
	 public String anonymousList(Model model,PagingDto pagingDto) {
		 pagingDto.setCount(boardService.getCount_a());
		 pagingDto.setPage(pagingDto.getPage());
		 List<BoardVo> list = boardService.anonymousList(pagingDto);
		 model.addAttribute("list",list);
		 model.addAttribute("pagingDto", pagingDto);
		 return "/company/board/anonymous/anonymous_list";
	 }
	
	// 익명게시판 등록
	@RequestMapping(value = "/board/anonymous/anonymous_regist", method = RequestMethod.GET)
	public String freeRegist() {
		return "/company/board/anonymous/anonymous_regist";
	}
	
	// 익명게시판 글 상세보기
	@RequestMapping(value = "/board/anonymous/anonymous_content", method = RequestMethod.GET)
	 public String registBoard(Model model, int bno) {
		 BoardVo boardVo = boardService.getBoard(bno);
		 BoardVo boardMoveVo = boardService.menuMove(bno); // 게시글 이동
		 List<CommentVo> list = commentService.commentList(bno); // 덧글 리스트
		 model.addAttribute("boardMoveVo",boardMoveVo);
		 model.addAttribute("boardVo",boardVo);
		 model.addAttribute("list",list);
		 System.out.println("FreeBC, list : " + list);
		 return "/company/board/anonymous/anonymous_content";
	 }
	
	// 익명게시판 글추가
	@RequestMapping(value="/board/anonymous/regist_run", method=RequestMethod.GET)
	public String boardRegistRun(BoardVo boardVo) {
		System.out.println("BoardController, boardRegistRun, boardVo:" + boardVo);
		boardService.insertAnonymousBoard(boardVo);
		return "redirect:/company/board/anonymous/anonymous_list";
	}
	
	// 익명게시판 글 삭제
	@RequestMapping(value="/board/anonymous/anonymous_delete", method=RequestMethod.GET)
	public String deleteBoard(int bno) {
		commentService.deleteCommentBoard(bno);
		boardService.deleteBoard(bno);
		return "redirect:/company/board/anonymous/anonymous_list";
	}
	
	// 익명게시판 글 수정 
	@RequestMapping(value="/board/anonymous/anonymous_modify_run", method=RequestMethod.GET)
	public String modifyBoard(BoardVo boardVo) {
		boardService.modifyBoard(boardVo);
		return "redirect:/company/board/anonymous/anonymous_content?bno="+ boardVo.getBno() + 
				"&title=" + boardVo.getTitle() + "&content=" + boardVo.getContent();
	}
	
	// 익명게시판 글 수정 폼
	@RequestMapping(value="/board/anonymous/anonymous_modify", method=RequestMethod.GET)
	public String searchByBno(Model model, int bno) {
		BoardVo boardVo = boardService.getBoard(bno);
		model.addAttribute("boardVo",boardVo);
		return "/company/board/anonymous/anonymous_modify";
	}
	
	
}
