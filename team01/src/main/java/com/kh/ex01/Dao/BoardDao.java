package com.kh.ex01.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ex01.vo.BoardVo;
import com.kh.ex01.vo.HireBoardVo;
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
	
	public int getCount_f() {
		int count = sqlSession.selectOne(NAMESPACE+"getCount_f");
		return count;
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
	
	public int getCount_a() {
		int count = sqlSession.selectOne(NAMESPACE+"getCount_a");
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
	
	// 채용공고글 추가
	public void insertHireBoard (HireBoardVo hireboardVo) {
		sqlSession.insert(NAMESPACE +"insertHireBoard", hireboardVo);
	}
	
//	//자료실
//	public List<BoardVo> libraryList(PagingDto pagingDto) {
//		List<BoardVo> list = sqlSession.selectList(NAMESPACE + "libraryList", pagingDto);
//		return list;
//	}
//	
//	public void insertLibraryBoard(BoardVo boardVo) {
//		sqlSession.insert(NAMESPACE + "insertLibraryBoard", boardVo);
//	}
//	
//	public int getCount_l() {
//		int count = sqlSession.selectOne(NAMESPACE+"getCount_f");
//		return count;
//	}
	
//------------------------ 게시판 공통 시작
	//글 시퀀스 얻기
	public int getBnoSeq() {
		int bno = sqlSession.selectOne(NAMESPACE + "getBnoSeq");
		return bno;
	}
	
	//글 내용
	public BoardVo boardContent(int bno) {
		BoardVo boardVo = sqlSession.selectOne(NAMESPACE + "boardContent", bno);
		return boardVo;
	}
	
	//글 수정
	public void boardModifyRun(BoardVo boardVo) {
		sqlSession.update(NAMESPACE + "boardModifyRun", boardVo);
	}
	
	//글 삭제
	public void boardDeleteRun(int bno) {
		sqlSession.delete(NAMESPACE + "boardDeleteRun", bno);
	}
//------------------------ 게시판 공통 끝
//------------------------ 공지사항 시작
	//공지 글 개수
	public int getNoticeCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getNoticeCount", pagingDto);
		return count;
	}
	
	//공지 리스트
	public List<BoardVo> noticeList(PagingDto pagingDto) {
		List<BoardVo> list = sqlSession.selectList(NAMESPACE + "noticeList", pagingDto);
		return list;
	}
	
	//공지게시판 글 작성
	public void noticeRegistRun (BoardVo boardVo) {
		sqlSession.insert(NAMESPACE + "noticeRegistRun", boardVo);
	}
	
	//파일 업로드
	public void uploadBoardFile (String bno, String filename) {
		Map<String, String> map = new HashMap<>();
		map.put("bno", bno);
		map.put("filename", filename);
		sqlSession.insert(NAMESPACE + "uploadBoardFile", map);
	}
	
	//파일 다운로드
	public List<String> downloadBoardFile(int bno) {
		List<String> filenames = sqlSession.selectList(NAMESPACE + "downloadBoardFile", bno);
		return filenames;
	}
	
	//첨부파일 삭제
	public void fileDeleteRun(int bno) {
		sqlSession.delete(NAMESPACE + "fileDeleteRun", bno);
	}
//------------------------ 공지사항 끝
//------------------------ 자료실 시작
	//자료실 글 개수
	public int getPdsCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getPdsCount", pagingDto);
		return count;
	}
	
	//자료실 목록
	public List<BoardVo> pdsList(PagingDto pagingDto) {
		List<BoardVo> list = sqlSession.selectList(NAMESPACE + "pdsList", pagingDto);
		return list;
	}
	
	//자료실 글 작성
	public void pdsRegistRun (BoardVo boardVo) {
		sqlSession.insert(NAMESPACE + "pdsRegistRun", boardVo);
	}
//------------------------ 자료실 끝
//------------------------ 메인 화면 조회
	public List<BoardVo> mainBoardList(String bcate) {
		List<BoardVo> list = sqlSession.selectList(NAMESPACE + "mainBoardList", bcate);
		return list;
	};
//------------------------ 메인 화면 끝
	

}