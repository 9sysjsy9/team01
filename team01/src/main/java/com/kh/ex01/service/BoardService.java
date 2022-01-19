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
	
	public int getCount_f() {
		int count = boardDao.getCount_f();
		return count;
	}
	
	public int getCount_l() {
		int count = boardDao.getCount_f();
		return count;
	}
	
	public int getCount_a() {
		int count = boardDao.getCount_a();
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
	//시퀀스 얻기
	public int getBnoSeq() {
		int bno = boardDao.getBnoSeq();
		return bno;
	}
	
	//공지 글 개수
	public int getNoticeCount(PagingDto pagingDto) {
		int count = boardDao.getNoticeCount(pagingDto);
		return count;
	}
	
	//공지사항 리스트
	public List<BoardVo> noticeList(PagingDto pagingDto){
		List<BoardVo> list = boardDao.noticeList(pagingDto);
		return list;
	}
	
	//공지사항 등록
	@Transactional
	public void noticeRegistRun(BoardVo boardVo) {
		boardDao.noticeRegistRun(boardVo);
		System.out.println("BoardService, noticeRegistRun, boardVo : " + boardVo);
		String bno = Integer.toString(boardVo.getBno());
		for(int i = 0 ; i < boardVo.getFiles().length ; i++) {
			boardDao.uploadBoardFile(bno, boardVo.getFiles()[i]);
		}
	}
	
	//공지 읽기
	@Transactional
	public BoardVo noticeContent(int bno) {
		boardDao.updateViewcnt(bno);
		BoardVo boardVo = boardDao.noticeContent(bno);
		
		List<String> filenames = boardDao.downloadBoardFile(bno);
		System.out.println("filenames : " + filenames);
		
		if(0 < filenames.size()) {
			String[] files = new String[filenames.size()];
			for(int i = 0 ; i < filenames.size() ; i++) {
				files[i] = filenames.get(i);
			}
			boardVo.setFiles(files);
		}
		return boardVo;
	}
	
	//공지 삭제
	@Transactional
	public void noticeDeleteRun(int bno) {
		boardDao.fileDeleteRun(bno);
		boardDao.noticeDeleteRun(bno);
	}
	
	//공지 수정
	public void noticeModifyRun(BoardVo boardVo) {
		boardDao.noticeModifyRun(boardVo);
	}
	
	//자료실
	public List<BoardVo> libraryList(PagingDto pagingDto) {
		return boardDao.libraryList(pagingDto);
	}
	
	public void insertLibraryBoard(BoardVo boardVo) {
		boardDao.insertLibraryBoard(boardVo);
	}
	
}
