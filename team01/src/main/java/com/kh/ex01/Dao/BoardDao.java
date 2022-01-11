package com.kh.ex01.Dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.BoardVo;
import com.kh.ex01.vo.PagingDto;




@Repository
public class BoardDao {
		
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.kh.ex01.mappers.board.";
	
	//자유게시판 리스트
	public List<BoardVo> freeList(PagingDto pagingDto) {
		List<BoardVo> list = sqlSession.selectList(NAMESPACE + "freeList", pagingDto);
		return list;
	}
	
	//익명게시판 리스트
	public List<BoardVo> anonymousList(PagingDto pagingDto) {
		List<BoardVo> list = sqlSession.selectList(NAMESPACE + "anonymousList", pagingDto);
		return list;
	}
	
	public BoardVo getBoard(int bno) {
		BoardVo boardVo = sqlSession.selectOne(NAMESPACE + "getBoard",bno);
		return boardVo;
	}
	
	public int getCount() {
		int count = sqlSession.selectOne(NAMESPACE+"getCount");
		return count;
	}
	
	// 자유게시판 글추가
	public void insertBoard(BoardVo boardVo) {
		sqlSession.insert(NAMESPACE + "insertBoard", boardVo);
	}
	
	// 익명게시판 글추가
	public void insertAnonymousBoard(BoardVo boardVo) {
		sqlSession.insert(NAMESPACE + "insertAnonymousBoard", boardVo);
	}
	
	public BoardVo menuMove(int bno) {
		BoardVo boardVo = sqlSession.selectOne(NAMESPACE + "menuMove",bno);
		return boardVo;
	}
	
	public void deleteBoard(int bno) {
		sqlSession.delete(NAMESPACE + "deleteBoard",bno);
	}
	
	public void modifyBoard(BoardVo boardVo) {
		sqlSession.update(NAMESPACE + "modifyBoard",boardVo);
	}
	
	public void updateViewcnt(int bno) {
		sqlSession.update(NAMESPACE + "updateViewcnt",bno);
	}
	
	
	
}