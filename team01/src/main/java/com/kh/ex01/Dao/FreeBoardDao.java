package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.BoardVo;




@Repository
public class FreeBoardDao {
		
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.kh.ex01.mappers.freeboard.";
	
	public List<BoardVo> freeList() {
		List<BoardVo> list = sqlSession.selectList(NAMESPACE + "freeList");
		return list;
	}
	
	public BoardVo getBoard(int bno) {
		BoardVo boardVo = sqlSession.selectOne(NAMESPACE + "getBoard",bno);
		return boardVo;
	}
	
	public void insertBoard(BoardVo boardVo) {
		sqlSession.insert(NAMESPACE + "insertBoard", boardVo);
	}
	
	public BoardVo menuMove(int bno) {
		BoardVo boardVo = sqlSession.selectOne(NAMESPACE + "menuMove",bno);
		return boardVo;
	}
	
	public void deleteBoard(int bno) {
		sqlSession.delete(NAMESPACE + "deleteBoard",bno);
	}
	
}