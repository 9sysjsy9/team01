package com.kh.ex01.controller;



import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ex01.service.CommentService;
import com.kh.ex01.vo.CommentVo;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Inject
	private CommentService commentService;
	
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
	
	@RequestMapping(value="/profileImg", method=RequestMethod.GET)
	public String profileImg()	{
		List<Object> list = commentService.profileImg();
		System.out.println("컨트롤:"+list );
		return null;
	}
}
