package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.BoardDao;
import com.kh.ex01.vo.BoardVo;
import com.kh.ex01.vo.HireBoardVo;
import com.kh.ex01.vo.PagingDto;

@Service
public class BoardService {
	
	@Inject
	BoardDao boardDao;
	
	//자유게시판 리스트
	public List<BoardVo> freeList(PagingDto pagingDto) {
		return boardDao.freeList(pagingDto);
	}
	
	//익명게시판 리스트
	public List<BoardVo> anonymousList(PagingDto pagingDto) {
		return boardDao.anonymousList(pagingDto);
	}
	
	public BoardVo getBoard(int bno) {
		boardDao.updateViewcnt(bno); // 조회수 증가
		BoardVo boardVo = boardDao.getBoard(bno);
		return boardVo;
	}
	
	public int getCount() {
		int count = boardDao.getCount();
		return count;
	}
	
	public void insertBoard(BoardVo boardVo) {
		boardDao.insertBoard(boardVo); 
	}
	
	public void insertAnonymousBoard(BoardVo boardVo) {
		boardDao.insertAnonymousBoard(boardVo);
	}
	
	public BoardVo menuMove(int bno) {
		BoardVo boardVo = boardDao.menuMove(bno);
		return boardVo;
	}
	
	public void deleteBoard(int bno) {
		boardDao.deleteBoard(bno);
	}
	
	public void modifyBoard(BoardVo boardVo) {
		boardDao.modifyBoard(boardVo);
	}
	
	public void updateViewcnt(int bno) {
		boardDao.updateViewcnt(bno);
	}
	
	//채용공고 등록
	public void insertHireBoard(HireBoardVo hireBoardVo) {
		boardDao.insertHireBoard(hireBoardVo);
	}
	
}
