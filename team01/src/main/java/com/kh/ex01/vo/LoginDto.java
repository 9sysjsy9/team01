package com.kh.ex01.vo;

public class LoginDto {
	private String userid;
	private String userpw;
	private String saveid;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getSaveid() {
		return saveid;
	}
	public void setSaveid(String saveid) {
		this.saveid = saveid;
	}
	@Override
	public String toString() {
		return "LoginDto [userid=" + userid + ", userpw=" + userpw + ", saveid=" + saveid + "]";
	}
	
}
