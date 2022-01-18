package com.kh.ex01.vo;

import java.sql.Timestamp;

public class BoardVo {

	private int bno; // NUMBER No 글번호
	private String bcate; // VARCHAR2(2 BYTE) No 게시판 종류 F:자유게시판 A:익명게시판 L:자료실 O:건의사항 N:공지사항
	private String title; // VARCHAR2(100 BYTE) No
	private String content; // VARCHAR2(1000 BYTE) No
	private String userid; // VARCHAR2(10 BYTE) Yes
	private int viewcnt; // NUMBER Yes
	private int re_group; // NUMBER Yes
	private int re_seq; // NUMBER Yes
	private int re_level; // NUMBER Yes
	private Timestamp regdate; // TIMESTAMP(6) Yes sysdate
	private Timestamp updatedate; // TIMESTAMP(6) Yes
	private int cmtcnt; // NUMBER Yes
	private int bstate; // NUMBER(1,0) Yes 0
	private String username;
	private int next; // 이번게시글의 다음
	private int prev; // 이번게시글의 이전
	
	public void setPage() {
		
	}
	
	public BoardVo() {
		super();
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBcate() {
		return bcate;
	}

	public void setBcate(String bcate) {
		this.bcate = bcate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getRe_group() {
		return re_group;
	}

	public void setRe_group(int re_group) {
		this.re_group = re_group;
	}

	public int getRe_seq() {
		return re_seq;
	}

	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Timestamp getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Timestamp updatedate) {
		this.updatedate = updatedate;
	}

	public int getCmtcnt() {
		return cmtcnt;
	}

	public void setCmtcnt(int cmtcnt) {
		this.cmtcnt = cmtcnt;
	}

	public int getBstate() {
		return bstate;
	}

	public void setBstate(int bstate) {
		this.bstate = bstate;
	}
	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	@Override
	public String toString() {
		return "BoardVo [bno=" + bno + ", bcate=" + bcate + ", title=" + title + ", content=" + content + ", userid="
				+ userid + ", viewcnt=" + viewcnt + ", re_group=" + re_group + ", re_seq=" + re_seq + ", re_level="
				+ re_level + ", regdate=" + regdate + ", updatedate=" + updatedate + ", cmtcnt=" + cmtcnt + ", bstate="
				+ bstate + ", username=" + username + ", next=" + next + ", prev=" + prev + "]";
	}


	
}
