package com.kh.ex01.service;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ex01.Dao.BoardDao;
import com.kh.ex01.Dao.CommentDao;
import com.kh.ex01.vo.CommentVo;
import com.kh.ex01.vo.MemberVo;


@Service
public class CommentService {
	
	@Inject
	CommentDao commentDao;
	
	@Inject
	BoardDao boardDao;
	
	public List<CommentVo> commentList(int bno){
		List<CommentVo> list = commentDao.commentList(bno);
		return list;
	}
	
	public void insertComment(CommentVo commentVo) {
		commentDao.insertComment(commentVo);
	}
	
	public void deleteComment(int cno) {
		commentDao.deleteComment(cno);
	}
	
	public CommentVo profileImg() {
		CommentVo commentVo = commentDao.profileImg();
		return commentVo;
	}
	
	public void deleteComment(int bno, int cno) {
		commentDao.deleteComment(cno);
	}
}
