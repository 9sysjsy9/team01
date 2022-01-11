package com.kh.ex01.vo;

import java.sql.Timestamp;

public class CsreceiveVo {

	private int csreceive_order;
	private String csreceive_name;
	private String csreceive_hp;
	private String csreceive_email;
	private String csreceive_title;
	private String csreceive_content;

	public int getCsreceive_order() {
		return csreceive_order;
	}

	public void setCsreceive_order(int csreceive_order) {
		this.csreceive_order = csreceive_order;
	}

	public String getCsreceive_name() {
		return csreceive_name;
	}

	public void setCsreceive_name(String csreceive_name) {
		this.csreceive_name = csreceive_name;
	}

	public String getCsreceive_hp() {
		return csreceive_hp;
	}

	public void setCsreceive_hp(String csreceive_hp) {
		this.csreceive_hp = csreceive_hp;
	}

	public String getCsreceive_email() {
		return csreceive_email;
	}

	public void setCsreceive_email(String csreceive_email) {
		this.csreceive_email = csreceive_email;
	}

	public String getCsreceive_title() {
		return csreceive_title;
	}

	public void setCsreceive_title(String csreceive_title) {
		this.csreceive_title = csreceive_title;
	}

	public String getCsreceive_content() {
		return csreceive_content;
	}

	public void setCsreceive_content(String csreceive_content) {
		this.csreceive_content = csreceive_content;
	}

	@Override
	public String toString() {
		return "CsreceiveVo [csreceive_order=" + csreceive_order + ", csreceive_name=" + csreceive_name
				+ ", csreceive_hp=" + csreceive_hp + ", csreceive_email=" + csreceive_email + ", csreceive_title="
				+ csreceive_title + ", csreceive_content=" + csreceive_content + "]";
	}

}
