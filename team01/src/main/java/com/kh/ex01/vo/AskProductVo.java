package com.kh.ex01.vo;

import java.sql.Timestamp;

public class AskProductVo {
	
	private int ano;//         not null number        
	private String order_code;//          varchar2(100) 
	private String ask_cate;//             varchar2(6)   
	private String ask_content;//          varchar2(500) 
	private String ask_reply;//            varchar2(500) 
	private String ask_title;//            varchar2(100) 
	private Timestamp ask_date;//             timestamp(6)  
	
	private String user_id;
	
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public AskProductVo() {
		super();
	}
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
	public String getAsk_cate() {
		return ask_cate;
	}
	public void setAsk_cate(String ask_cate) {
		this.ask_cate = ask_cate;
	}
	public String getAsk_content() {
		return ask_content;
	}
	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}
	public String getAsk_reply() {
		return ask_reply;
	}
	public void setAsk_reply(String ask_reply) {
		this.ask_reply = ask_reply;
	}
	public String getAsk_title() {
		return ask_title;
	}
	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}
	public Timestamp getAsk_date() {
		return ask_date;
	}
	public void setAsk_date(Timestamp ask_date) {
		this.ask_date = ask_date;
	}
	@Override
	public String toString() {
		return "AskProductVo [ano=" + ano + ", order_code=" + order_code + ", ask_cate=" + ask_cate + ", ask_content="
				+ ask_content + ", ask_reply=" + ask_reply + ", ask_title=" + ask_title + ", ask_date=" + ask_date
				+ ", user_id=" + user_id + "]";
	}

	
}
