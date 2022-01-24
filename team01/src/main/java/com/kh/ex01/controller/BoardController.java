package com.kh.ex01.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.ex01.service.BoardService;
import com.kh.ex01.service.CommentService;
import com.kh.ex01.util.MyFileUploadUtil;
import com.kh.ex01.vo.BoardVo;
import com.kh.ex01.vo.CommentVo;
import com.kh.ex01.vo.HireBoardVo;
import com.kh.ex01.vo.MemberVo;
import com.kh.ex01.vo.PagingDto;

@Controller
@RequestMapping("/company")
public class BoardController {
	
// 기능 담당자 : 고만재, 심재중

	private static final String UPLOAD_PATH = "//192.168.0.234/upload";

	@Inject
	private BoardService boardService;
	
	@Inject
	private CommentService commentService;
	
	
//고만재 파트
//공지사항, 자료실, 내 게시글 모아보기
//------------------------ 게시판 공통 시작
	//파일 다운로드
	@RequestMapping(value = "/board/fileDownload", method = RequestMethod.GET)
	public void fileDownLoad(HttpServletResponse response, String filename) throws Exception{
		String filePath = UPLOAD_PATH + "/" + filename;
//		System.out.println("BoardController, fileDownLoad, filePath : " + filePath);
		byte[] fileByte = FileUtils.readFileToByteArray(new File(filePath));
		response.setContentType("application/octet-stream");
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(""+filename+"", "UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
//------------------------ 공지 게시판 시작
	//공지사항 글 목록
	@RequestMapping(value = "/board/notice/notice_list", method=RequestMethod.GET)
	public String noticeList(Model model, PagingDto pagingDto) {
		pagingDto.setCount(boardService.getNoticeCount(pagingDto)); // 게시판 글 개수 얻어오기
		pagingDto.setPage(pagingDto.getPage()); //페이지 개수 갱신
		List<BoardVo> list = boardService.noticeList(pagingDto);
		model.addAttribute("boardList", list);
		model.addAttribute("pagingDto", pagingDto);
		return "/company/board/notice/notice_list";
	}
	
	//공지사항 글 작성 폼
	@RequestMapping(value = "/board/notice/notice_regist", method = RequestMethod.GET)
	public String noticeRegist(Model model, PagingDto pagingDto) {
		model.addAttribute("pagingDto", pagingDto);
		return "/company/board/notice/notice_regist";
	}
	
	//공지사항 글 작성 실행
	@RequestMapping(value = "/board/notice/noticeRegistRun", method = RequestMethod.POST)
	public String noticeRegistRun(MultipartHttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		BoardVo boardVo = new BoardVo();
		int bno = boardService.getBnoSeq();
		boardVo.setBno(bno);
		boardVo.setTitle(request.getParameter("title"));
		boardVo.setContent(request.getParameter("content"));
		boardVo.setUserid(request.getParameter("userid"));
		List<MultipartFile> files = request.getFiles("files");
//		System.out.println("BoardController, noticeRgistRun, boardVo : " + boardVo);
//		System.out.println("BoardController, noticeRgistRun, files : " + files);
		String[] fileNames = new String[files.size()];
		
		for(int i = 0 ; i < files.size() ; i++) {
			String originalName = files.get(i).getOriginalFilename();
			System.out.println("BoardController, noticeRgistRun, orifinalName : " + originalName);
			String seq = bno + "_" + i;
			fileNames[i] = MyFileUploadUtil.uploadBoardFile(UPLOAD_PATH, originalName, seq, files.get(i).getBytes());
		}
		boardVo.setFiles(fileNames);
		boardService.noticeRegistRun(boardVo);
		return "redirect:/company/board/notice/notice_content?bno="+bno;
	}
	
	//공지사항 글 내용
	@RequestMapping(value = "/board/notice/notice_content", method = RequestMethod.GET)
	public String noticeContent(Model model, int bno, PagingDto pagingDto) {
		BoardVo boardVo = boardService.boardContent(bno);
		model.addAttribute("content", boardVo);
		model.addAttribute("pagingDto", pagingDto);
		return "/company/board/notice/notice_content";
	}
	
	//공지사항 수정
	@RequestMapping(value = "/board/notice/notice_modify", method = RequestMethod.GET)
	public String noticeModify(Model model, int bno, PagingDto pagingDto)  {
//		System.out.println("BoardController, noticeModifyRun, bno : " + bno);
		BoardVo boardVo = boardService.boardContent(bno);
		model.addAttribute("content", boardVo);
		model.addAttribute("pagingDto", pagingDto);
		return "/company/board/notice/notice_modify";
	}
	
	//공지사항 글 수정 실행
	@RequestMapping(value = "/board/notice/noticeModifyRun", method = RequestMethod.POST)
	public String noticeModifyRun(BoardVo boardVo, PagingDto pagingDto) {
		boardService.boardModifyRun(boardVo);
		return "redirect:/company/board/notice/notice_content?bno="+boardVo.getBno();
	}
	
	//공지사항 글 삭제
	@RequestMapping(value = "/board/notice/noticeDeleteRun/{bno}", method = RequestMethod.GET, produces = "application/text;charset=utf-8")
	public String noticeDeleteRun(@PathVariable int bno) throws Exception{
		BoardVo boardVo = boardService.boardContent(bno);
		String[] fileNames = boardVo.getFiles();
		if(fileNames != null) {
			for(int i = 0 ; i < fileNames.length ; i++) {
				MyFileUploadUtil.deleteFile(UPLOAD_PATH + "/" + fileNames[i]);
			}
		}
		boardService.boardDeleteRun(bno);
		return "redirect:/company/board/notice/notice_list";
	}
//------------------------ 공지 게시판 끝
//------------------------ 자료실 시작
	//자료실 글 목록
	@RequestMapping(value = "/board/pds/pds_list", method=RequestMethod.GET)
	public String pdsList(Model model, PagingDto pagingDto) {
		pagingDto.setCount(boardService.getPdsCount(pagingDto)); // 게시판 글 개수 얻어오기
		pagingDto.setPage(pagingDto.getPage()); //페이지 개수 갱신
		List<BoardVo> list = boardService.pdsList(pagingDto);
		model.addAttribute("boardList", list);
		model.addAttribute("pagingDto", pagingDto);
		return "/company/board/pds/pds_list";
	}
	//자료실 글 작성 폼
	@RequestMapping(value = "/board/pds/pds_regist", method = RequestMethod.GET)
	public String pdsRegist(Model model, PagingDto pagingDto) {
		model.addAttribute("pagingDto", pagingDto);
		return "/company/board/pds/pds_regist";
	}
	
	//자료실 글 작성 실행
	@RequestMapping(value = "/board/pds/pdsRegistRun", method = RequestMethod.POST)
	public String pdsRegistRun(MultipartHttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		BoardVo boardVo = new BoardVo();
		int bno = boardService.getBnoSeq();
		boardVo.setBno(bno);
		boardVo.setTitle(request.getParameter("title"));
		boardVo.setContent(request.getParameter("content"));
		boardVo.setUserid(request.getParameter("userid"));
		List<MultipartFile> files = request.getFiles("files");
//		System.out.println("BoardController, pdsRgistRun, boardVo : " + boardVo);
//		System.out.println("BoardController, pdsRgistRun, files : " + files);
		String[] fileNames = new String[files.size()];
		
		for(int i = 0 ; i < files.size() ; i++) {
			String originalName = files.get(i).getOriginalFilename();
//			System.out.println("BoardController, noticeRgistRun, orifinalName : " + originalName);
			String seq = bno + "_" + i;
			fileNames[i] = MyFileUploadUtil.uploadBoardFile(UPLOAD_PATH, originalName, seq, files.get(i).getBytes());
		}
		boardVo.setFiles(fileNames);
		boardService.pdsRegistRun(boardVo);
		return "redirect:/company/board/pds/pds_content?bno="+bno;
	}
	
	//자료실 글 내용
	@RequestMapping(value = "/board/pds/pds_content", method = RequestMethod.GET)
	public String pdsContent(Model model, int bno, PagingDto pagingDto) {
		BoardVo boardVo = boardService.boardContent(bno);
		model.addAttribute("content", boardVo);
		model.addAttribute("pagingDto", pagingDto);
		return "/company/board/pds/pds_content";
	}
	
	//자료실 글 수정 폼
	@RequestMapping(value = "/board/pds/pds_modify", method = RequestMethod.GET)
	public String pdsModify(Model model, int bno, PagingDto pagingDto)  {
		System.out.println("BoardController, pdsModifyRun, bno : " + bno);
		BoardVo boardVo = boardService.boardContent(bno);
		model.addAttribute("content", boardVo);
		model.addAttribute("pagingDto", pagingDto);
		return "/company/board/pds/pds_modify";
	}
	
	//자료실 글 수정 실행
	@RequestMapping(value = "/board/pds/pdsModifyRun", method = RequestMethod.POST)
	public String pdsModifyRun(BoardVo boardVo, PagingDto pagingDto) {
		boardService.boardModifyRun(boardVo);
		return "redirect:/company/board/pds/pds_content?bno="+boardVo.getBno();
	}
	
	//자료실 글 삭제 실행
	@RequestMapping(value = "/board/pds/pdsDeleteRun/{bno}", method = RequestMethod.GET, produces = "application/text;charset=utf-8")
	public String pdsDeleteRun(@PathVariable int bno) throws Exception{
		BoardVo boardVo = boardService.boardContent(bno);
		String[] fileNames = boardVo.getFiles();
		if(fileNames != null) {
			for(int i = 0 ; i < fileNames.length ; i++) {
				MyFileUploadUtil.deleteFile(UPLOAD_PATH + "/" + fileNames[i]);
			}
		}
		boardService.boardDeleteRun(bno);
		return "redirect:/company/board/pds/pds_list";
	}

//------------------------ 내 게시글 시작
	@RequestMapping(value = "/board/myboard/myboard_list", method=RequestMethod.GET)
	public String myBoardList(Model model, PagingDto pagingDto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVo loginData = (MemberVo)session.getAttribute("loginData");
		pagingDto.setUserid(loginData.getUserid());
		pagingDto.setCount(boardService.getMyBoardCount(pagingDto)); // 게시판 글 개수 얻어오기
		pagingDto.setPage(pagingDto.getPage()); //페이지 개수 갱신
		List<BoardVo> list = boardService.myBoardList(pagingDto);
		model.addAttribute("boardList", list);
		model.addAttribute("pagingDto", pagingDto);
		return "/company/board/myboard/myboard_list";
	}
//------------------------ 내 게시글 끝
	
	
	
	
	// 자유게시판 목록
	@RequestMapping(value = "/board/free/free_list", method = RequestMethod.GET)
	 public String freeList(Model model,PagingDto pagingDto) {
		 pagingDto.setCount(boardService.getCount_f());
		 pagingDto.setPage(pagingDto.getPage());
		 List<BoardVo> list = boardService.freeList(pagingDto);
		 model.addAttribute("list",list);
		 model.addAttribute("pagingDto", pagingDto);
		 return "/company/board/free/free_list";
	 }
	
	
	// 자유게시판 등록
	@RequestMapping(value = "/board/free/free_regist", method = RequestMethod.GET)
	public String freeRegist() {
		return "/company/board/free/free_regist";
	}
	
	// 자유게시판 글 상세보기
	@RequestMapping(value = "/board/free/free_content", method = RequestMethod.GET)
	 public String registBoard(Model model, int bno) {
		 BoardVo boardVo = boardService.getBoard(bno);
		 BoardVo boardMoveVo = boardService.menuMove_f(bno); // 게시글 이동
		 List<CommentVo> list = commentService.commentList(bno); // 덧글 리스트
		 model.addAttribute("boardMoveVo",boardMoveVo);
		 model.addAttribute("boardVo",boardVo);
		 model.addAttribute("list",list);
		 return "/company/board/free/free_content";
	 }
	
	// 자유게시판 글추가
	@RequestMapping(value="/board/free/regist_run", method=RequestMethod.GET)
	public String boardRegistRun(BoardVo boardVo) {
		System.out.println("BoardController, boardRegistRun, boardVo:" + boardVo);
		boardService.insertBoard(boardVo);
		return "redirect:/company/board/free/free_list";
	}
	
	// 자유게시판 글 삭제
	@RequestMapping(value="/board/free/free_delete", method=RequestMethod.GET)
	public String deleteBoard(int bno) {
		boardService.deleteBoard(bno);
		return "redirect:/company/board/free/free_list";
	}
	
	// 자유게시판 글 수정 
	@RequestMapping(value="/board/free/free_modify_run", method=RequestMethod.GET)
	public String modifyBoard(BoardVo boardVo) {
		boardService.modifyBoard(boardVo);
		return "redirect:/company/board/free/free_content?bno="+ boardVo.getBno() + 
				"&title=" + boardVo.getTitle() + "&content=" + boardVo.getContent();
	}
	
	// 자유게시판 글 수정 폼
	@RequestMapping(value="/board/free/free_modify", method=RequestMethod.GET)
	public String searchByBno(Model model, int bno) {
		BoardVo boardVo = boardService.getBoard(bno);
		model.addAttribute("boardVo",boardVo);
		return "/company/board/free/free_modify";
	}
	
	// 채용공고 글 등록폼
	@RequestMapping(value="/hire/regist_board", method=RequestMethod.GET)
	public String hireBoardResgist() {
		return "/company/hire/regist_board";
	}
	
	// 채용공고 등록
	@RequestMapping(value="/hire/regist_board_run", method=RequestMethod.GET)
	public String hireBoardResgistRun(HireBoardVo hireBoardVo) {
		boardService.insertHireBoard(hireBoardVo);
		return "redirect:/hire/company/regist_list";
	}

//------------------------ 익명 게시판
	// 익명게시판 목록
	@RequestMapping(value = "/board/anonymous/anonymous_list", method = RequestMethod.GET)
	 public String anonymousList(Model model,PagingDto pagingDto) {
		 pagingDto.setCount(boardService.getCount_a());
		 pagingDto.setPage(pagingDto.getPage());
		 List<BoardVo> list = boardService.anonymousList(pagingDto);
		 model.addAttribute("list",list);
		 model.addAttribute("pagingDto", pagingDto);
		 return "/company/board/anonymous/anonymous_list";
	 }
	
	// 익명게시판 등록
	@RequestMapping(value = "/board/anonymous/anonymous_regist", method = RequestMethod.GET)
	public String anonymousRegist() {
		return "/company/board/anonymous/anonymous_regist";
	}
	
	// 익명게시판 글 상세보기
	@RequestMapping(value = "/board/anonymous/anonymous_content", method = RequestMethod.GET)
	 public String anonymousRegistBoard(Model model, int bno) {
		 BoardVo boardVo = boardService.getBoard(bno);
		 BoardVo boardMoveVo = boardService.menuMove_a(bno); // 게시글 이동
		 List<CommentVo> list = commentService.commentList(bno); // 덧글 리스트
		 model.addAttribute("boardMoveVo",boardMoveVo);
		 model.addAttribute("boardVo",boardVo);
		 model.addAttribute("list",list);
		 System.out.println("FreeBC, list : " + list);
		 return "/company/board/anonymous/anonymous_content";
	 }
	
	// 익명게시판 글추가
	@RequestMapping(value="/board/anonymous/regist_run", method=RequestMethod.GET)
	public String anonymousBoardRegistRun(BoardVo boardVo) {
		System.out.println("BoardController, boardRegistRun, boardVo:" + boardVo);
		boardService.insertAnonymousBoard(boardVo);
		return "redirect:/company/board/anonymous/anonymous_list";
	}
	
	// 익명게시판 글 삭제
	@RequestMapping(value="/board/anonymous/anonymous_delete", method=RequestMethod.GET)
	public String anonymousDeleteBoard(int bno) {
		boardService.deleteBoard(bno);
		return "redirect:/company/board/anonymous/anonymous_list";
	}
	
	// 익명게시판 글 수정 
	@RequestMapping(value="/board/anonymous/anonymous_modify_run", method=RequestMethod.GET)
	public String anonymousModifyBoard(BoardVo boardVo) {
		boardService.modifyBoard(boardVo);
		return "redirect:/company/board/anonymous/anonymous_content?bno="+ boardVo.getBno() + 
				"&title=" + boardVo.getTitle() + "&content=" + boardVo.getContent();
	}
	
	// 익명게시판 글 수정 폼
	@RequestMapping(value="/board/anonymous/anonymous_modify", method=RequestMethod.GET)
	public String anonymousSearchByBno(Model model, int bno) {
		BoardVo boardVo = boardService.getBoard(bno);
		model.addAttribute("boardVo",boardVo);
		return "/company/board/anonymous/anonymous_modify";
	}
		
}
