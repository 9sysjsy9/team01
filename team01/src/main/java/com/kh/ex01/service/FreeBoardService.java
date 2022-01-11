package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.ex01.Dao.FreeBoardDao;
import com.kh.ex01.vo.BoardVo;
import com.kh.ex01.vo.PagingDto;

@Service
public class FreeBoardService {
	
	@Inject
	FreeBoardDao freeBoardDao;
	
	public List<BoardVo> freeList(PagingDto pagingDto) {
		return freeBoardDao.freeList(pagingDto);
	}
	
	public BoardVo getBoard(int bno) {
		freeBoardDao.updateViewcnt(bno); // 조회수 증가
		BoardVo boardVo = freeBoardDao.getBoard(bno);
		return boardVo;
	}
	
	public int getCount() {
		int count = freeBoardDao.getCount();
		return count;
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
	
	public void updateViewcnt(int bno) {
		freeBoardDao.updateViewcnt(bno);
	}
	
}
