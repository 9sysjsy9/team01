package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.FreeBoardDao;
import com.kh.ex01.vo.BoardVo;

@Service
public class FreeBoardService {
	
	@Inject
	FreeBoardDao freeBoardDao;
	
	public List<BoardVo> freeList() {
		return freeBoardDao.freeList();
	}
	
	public BoardVo getBoard(int bno) {
		BoardVo boardVo = freeBoardDao.getBoard(bno);
		return boardVo;
	}
	
	public void insertBoard(BoardVo boardVo) {
		freeBoardDao.insertBoard(boardVo); 
	}
	
	public BoardVo menuMove(int bno) {
		BoardVo boardVo = freeBoardDao.menuMove(bno);
		return boardVo;
	}
	
	public void deleteBoard(int bno) {
		freeBoardDao.deleteBoard(bno);
	}
	
	public void modifyBoard(BoardVo boardVo) {
		freeBoardDao.modifyBoard(boardVo);
	}
	
}
