package com.kh.ex01.vo;

import java.sql.Timestamp;

public class UserVo {

	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private String user_email;
	private String user_addr;
	
	//
	private Timestamp order_regdate;
	private String order_shoescode;
	
	
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	
	
	
	public Timestamp getOrder_regdate() {
		return order_regdate;
	}
	public void setOrder_regdate(Timestamp order_regdate) {
		this.order_regdate = order_regdate;
	}
	public String getOrder_shoescode() {
		return order_shoescode;
	}
	public void setOrder_shoescode(String order_shoescode) {
		this.order_shoescode = order_shoescode;
	}
	
	@Override
	public String toString() {
		return "UserVo [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_phone="
				+ user_phone + ", user_email=" + user_email + ", user_addr=" + user_addr + ", order_regdate="
				+ order_regdate + ", order_shoescode=" + order_shoescode + "]";
	}
	


	
}
