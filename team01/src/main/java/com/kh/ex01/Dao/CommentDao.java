package com.kh.ex01.Dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.CommentVo;
import com.kh.ex01.vo.MemberVo;



@Repository
public class CommentDao {
		
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.kh.ex01.mappers.comment.";
	
	public List<CommentVo> commentList(int bno){
		List<CommentVo> list = sqlSession.selectList(NAMESPACE + "commentList",bno);
		return list;
	}
	
	public void insertComment(CommentVo commentVo) {
		sqlSession.insert(NAMESPACE + "insertComment", commentVo);
	}
	
	public void deleteComment(int cno) {
		sqlSession.delete(NAMESPACE + "deleteComment",cno);
	}
	
	public CommentVo profileImg() {
		CommentVo commentVo = sqlSession.selectOne(NAMESPACE + "profileImg");
		return commentVo;
	}
	
}