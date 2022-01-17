package com.kh.ex01.vo;

import java.sql.Timestamp;

public class ScheduleVo {
	private int sno;// number no
	private String userid;// varchar2(10 byte) yes
	private int syear;// number(4,0) no
	private int smonth;// number(2,0) no
	private int sdate;// number(2,0) no
	private Timestamp regdate;// timestamp(6) yes sysdate
	private Timestamp updatedate;// timestamp(6) yes
	private int authority;// number no 0
	private String content;// varchar2(100 byte) no

	private String username;

	public ScheduleVo() {
		super();
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getSyear() {
		return syear;
	}

	public void setSyear(int syear) {
		this.syear = syear;
	}

	public int getSmonth() {
		return smonth;
	}

	public void setSmonth(int smonth) {
		this.smonth = smonth;
	}

	public int getSdate() {
		return sdate;
	}

	public void setSdate(int sdate) {
		this.sdate = sdate;
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

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "ScheduleVo [sno=" + sno + ", userid=" + userid + ", syear=" + syear + ", smonth=" + smonth + ", sdate="
				+ sdate + ", regdate=" + regdate + ", updatedate=" + updatedate + ", authority=" + authority
				+ ", content=" + content + ", username=" + username + "]";
	}

}
