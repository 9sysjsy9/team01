package com.kh.ex01.vo;

import java.sql.Timestamp;

public class CsreceiveVo {

	private int cs_num;
	private String title;
	private String content;
	private String user_id;
	private String cate;
	private String order_code;

	public int getCs_num() {
		return cs_num;
	}

	public void setCs_num(int cs_num) {
		this.cs_num = cs_num;
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCate() {
		return cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public String getOrder_code() {
		return order_code;
	}

	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}

	@Override
	public String toString() {
		return "CsreceiveVo [cs_num=" + cs_num + ", title=" + title + ", content=" + content + ", user_id=" + user_id
				+ ", cate=" + cate + ", order_code=" + order_code + "]";
	}

}
