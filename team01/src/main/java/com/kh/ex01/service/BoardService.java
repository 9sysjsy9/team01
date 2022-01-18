package com.kh.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
//-----------------------공지 게시판-----------------------
	//공지 글 개수
	public int getNoticeCount() {
		int count = boardDao.getNoticeCount();
		return count;
	}
	
	//공지사항 리스트
	public List<BoardVo> noticeList(PagingDto pagingDto){
		List<BoardVo> list = boardDao.noticeList(pagingDto);
		return list;
	}
	
	//공지사항 등록
	public void noticeRegistRun(BoardVo boardVo) {
		boardDao.noticeRegistRun(boardVo);
	}
	
	//공지 읽기
	@Transactional
	public BoardVo noticeContent(int bno) {
		boardDao.updateViewcnt(bno);
		BoardVo boardVo = boardDao.noticeContent(bno);
		return boardVo;
	}
	
	//공지 삭제
	public void noticeDeleteRun(int bno) {
		boardDao.noticeDeleteRun(bno);
	}
	
	//공지 수정
	public void noticeModifyRun(BoardVo boardVo) {
		boardDao.noticeModifyRun(boardVo);
	}
	
}
