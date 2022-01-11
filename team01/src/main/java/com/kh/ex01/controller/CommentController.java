package com.kh.ex01.controller;



import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.CommentService;
import com.kh.ex01.vo.CommentVo;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Inject
	private CommentService commentService;
	
	@RequestMapping(value="/insertComment", method=RequestMethod.POST)
	public String insertComment(CommentVo commentVo) {
		System.out.println("CommentController, insertComment, commentVo:" + commentVo);
		int bno = commentVo.getBno();
		commentService.insertComment(commentVo);
		return "redirect:/company/board/free/free_content?bno=" + bno;
	}
}
