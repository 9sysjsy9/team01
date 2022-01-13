package com.kh.ex01.vo;

import java.sql.Timestamp;

public class OrderProductVo {
	private String order_code; //	varchar2(100 byte)	no	
	private String order_shoescode; //	varchar2(50 byte)	yes	
	private Timestamp order_regdate; //	timestamp(6)	yes	sysdate
	private int order_shoesprice; //	number(30,0)	yes	
	private String user_id; //	varchar2(100 byte)	yes	
	private String user_pw; //	varchar2(100 byte)	yes	
	
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	public String getOrder_shoescode() {
		return order_shoescode;
	}
	public void setOrder_shoescode(String order_shoescode) {
		this.order_shoescode = order_shoescode;
	}
	public Timestamp getOrder_regdate() {
		return order_regdate;
	}
	public void setOrder_regdate(Timestamp order_regdate) {
		this.order_regdate = order_regdate;
	}
	public int getOrder_shoesprice() {
		return order_shoesprice;
	}
	public void setOrder_shoesprice(int order_shoesprice) {
		this.order_shoesprice = order_shoesprice;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	
	@Override
	public String toString() {
		return "OrderProductVo [order_code=" + order_code + ", order_shoescode=" + order_shoescode + ", order_regdate="
				+ order_regdate + ", order_shoesprice=" + order_shoesprice + ", user_id=" + user_id + ", user_pw="
				+ user_pw + "]";
	}
	
}
