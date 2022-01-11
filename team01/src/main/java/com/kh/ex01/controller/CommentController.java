package com.kh.ex01.controller;



import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.ex01.service.CommentService;
import com.kh.ex01.vo.CommentVo;

@RestController
@RequestMapping("/comment")
public class CommentController {
	
	@Inject
	private CommentService commentService;
	
	@RequestMapping(value="/insertComment", method=RequestMethod.POST)
	public String insertComment(CommentVo commentVo) {
		System.out.println("CommentController, insertComment, commentVo:" + commentVo);
		commentService.insertComment(commentVo);
		return "success";
	}
}
