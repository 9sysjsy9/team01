package com.kh.ex01.vo;

import java.util.Date;

public class AskProductVo {
	private int ano;
	private String title;
	private String content;
	private Date regdate;
	private String name;
	private String email;
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "AskProductVo [ano=" + ano + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", name=" + name + ", email=" + email + "]";
	}
	
}
