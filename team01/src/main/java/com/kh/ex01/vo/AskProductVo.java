package com.kh.ex01.vo;

import java.util.Date;

public class AskProductVo {
	private int ano;
	private String order_code;
	private String ask_content;
	private String ask_title;
	private Date ask_date;
	private String user_id;
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	public String getAsk_content() {
		return ask_content;
	}
	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}
	public String getAsk_title() {
		return ask_title;
	}
	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}
	public Date getAsk_date() {
		return ask_date;
	}
	public void setAsk_date(Date ask_date) {
		this.ask_date = ask_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "AskProductVo [ano=" + ano + ", order_code=" + order_code + ", ask_content=" + ask_content
				+ ", ask_title=" + ask_title + ", ask_date=" + ask_date + ", user_id=" + user_id + "]";
	}
	
	
}
