package com.kh.ex01.service;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.CommentDao;
import com.kh.ex01.vo.CommentVo;


@Service
public class CommentService {
	
	@Inject
	CommentDao commentDao;
	
	public List<CommentVo> commentList(int bno){
		List<CommentVo> list = commentDao.commentList(bno);
		return list;
	}
	
	public void insertComment(CommentVo commentVo) {
		commentDao.insertComment(commentVo);
	}
	
	public void deleteCommentBoard(int bno) {
		commentDao.deleteCommentBoard(bno);
	}
	
	public List<Object> profileImg(){
		List<Object> list = commentDao.profileImg();
		return list;
	}
}
