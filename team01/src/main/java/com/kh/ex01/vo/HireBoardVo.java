package com.kh.ex01.vo;

import java.sql.Timestamp;

public class HireBoardVo {

	private int bno;
	private String cate;
	private String title;
	private String writer;
	private Timestamp regdate;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "HireVo [bno=" + bno + ", cate=" + cate + ", title=" + title + ", writer=" + writer + ", regdate="
				+ regdate + "]";
	}
	
}