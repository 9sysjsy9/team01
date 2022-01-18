package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.BoardService;
import com.kh.ex01.service.CommentService;
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
//공지사항 게시판 ----------------------------------------------
	//공지사항 글 리스트
	@RequestMapping(value = "/board/notice/notice_list", method=RequestMethod.GET)
	public String noticeList(Model model, PagingDto pagingDto) {
		pagingDto.setCount(boardService.getNoticeCount(pagingDto)); // 게시판 글 개수 얻어오기
		pagingDto.setPage(pagingDto.getPage()); //페이지 개수 갱신
		List<BoardVo> list = boardService.noticeList(pagingDto);
		model.addAttribute("noticeList", list);
		model.addAttribute("noticePagingDto", pagingDto);
		return "/company/board/notice/notice_list";
	}
	
	//공지사항 작성 폼
	@RequestMapping(value = "/board/notice/notice_regist", method = RequestMethod.GET)
	public String noticeRegist(Model model, PagingDto pagingDto) {
		model.addAttribute("noticePagingDto", pagingDto);
		return "/company/board/notice/notice_regist";
	}
	//공지사항 작성 Run
	@RequestMapping(value = "/board/notice/noticeRegistRun", method = RequestMethod.POST)
	public String noticeRegistRun(BoardVo boardVo) {
		int bno = boardService.getBnoSeq();
		boardVo.setBno(bno);
		System.out.println("BoardController, noticeRgistRun, boardVo : " + boardVo);
		boardService.noticeRegistRun(boardVo);
		return "redirect:/company/board/notice/notice_content?bno="+bno;
	}
	//공지사항 ContentView
	@RequestMapping(value = "/board/notice/notice_content", method = RequestMethod.GET)
	public String noticeContent(Model model, int bno, PagingDto pagingDto) {
		BoardVo boardVo = boardService.noticeContent(bno);
		model.addAttribute("noticeContent", boardVo);
		model.addAttribute("noticePagingDto", pagingDto);
		return "/company/board/notice/notice_content";
	}
	
	@RequestMapping(value = "/board/notice/noticeDeleteRun/{bno}", method = RequestMethod.GET, produces = "application/text;charset=utf-8")
	public String noticeDeleteRun(@PathVariable int bno) {
		boardService.noticeDeleteRun(bno);
		return "redirect:/company/board/notice/notice_list";
	}
	
	@RequestMapping(value = "/board/notice/notice_modify", method = RequestMethod.GET)
	public String noticeModify(Model model, int bno, PagingDto pagingDto)  {
		System.out.println("BoardController, noticeModifyRun, bno : " + bno);
		BoardVo boardVo = boardService.noticeContent(bno);
		model.addAttribute("noticeContent", boardVo);
		model.addAttribute("noticePagingDto", pagingDto);
		return "/company/board/notice/notice_modify";
	}
	
	@RequestMapping(value = "/board/notice/noticeModifyRun", method = RequestMethod.POST)
	public String notiveModifyRun(BoardVo boardVo, PagingDto pagingDto) {
		boardService.noticeModifyRun(boardVo);
		return "redirect:/company/board/notice/notice_content?bno="+boardVo.getBno();
	}
	
	
}
