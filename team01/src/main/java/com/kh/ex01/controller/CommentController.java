package com.kh.ex01.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.BoardService;
import com.kh.ex01.service.CommentService;
import com.kh.ex01.vo.CommentVo;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Inject
	private CommentService commentService;
	
	@Inject
	private BoardService boardService;
	
	
	//자유게시판 댓글
	@RequestMapping(value="/insertFreeComment", method=RequestMethod.POST)
	public String insertFreeComment(CommentVo commentVo) {
		System.out.println("CommentController, insertComment, commentVo:" + commentVo);
		int bno = commentVo.getBno();
		commentService.insertComment(commentVo);
		return "redirect:/company/board/free/free_content?bno=" + bno;
	}
	
	//익명게시판 댓글
	@RequestMapping(value="/insertAnonymousComment", method=RequestMethod.POST)
	public String insertAnonymousComment(CommentVo commentVo) {
		System.out.println("CommentController, insertComment, commentVo:" + commentVo);
		int bno = commentVo.getBno();
		commentService.insertComment(commentVo);
		return "redirect:/company/board/anonymous/anonymous_content?bno=" + bno;
	}
	
	//자유게시판 댓글 삭제
	@RequestMapping(value="/deleteFreeComment", method=RequestMethod.GET)
	public String deleteFreeComment(int cno, int bno) {
		commentService.deleteCommentBoard(cno);
		boardService.getBoard(bno);
		System.out.println("cno: "+ cno);
		System.out.println("bno: "+ bno);
		return "redirect:/company/board/free/free_content?bno=" + bno;
	}
}
