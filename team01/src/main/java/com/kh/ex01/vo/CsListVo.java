package com.kh.ex01.vo;

import java.sql.Timestamp;

public class CsListVo {

	private String csList_no;
	private String csList_csCate;
	private String csList_csName;
	private String csList_csTitle;
	private String csList_csDate;

	public String getCsList_no() {
		return csList_no;
	}

	public void setCsList_no(String csList_no) {
		this.csList_no = csList_no;
	}

	public String getCsList_csCate() {
		return csList_csCate;
	}

	public void setCsList_csCate(String csList_csCate) {
		this.csList_csCate = csList_csCate;
	}

	public String getCsList_csName() {
		return csList_csName;
	}

	public void setCsList_csName(String csList_csName) {
		this.csList_csName = csList_csName;
	}

	public String getCsList_csTitle() {
		return csList_csTitle;
	}

	public void setCsList_csTitle(String csList_csTitle) {
		this.csList_csTitle = csList_csTitle;
	}

	public String getCsList_csDate() {
		return csList_csDate;
	}

	public void setCsList_csDate(String csList_csDate) {
		this.csList_csDate = csList_csDate;
	}

	@Override
	public String toString() {
		return "CsListVo [csList_no=" + csList_no + ", csList_csCate=" + csList_csCate + ", csList_csName="
				+ csList_csName + ", csList_csTitle=" + csList_csTitle + ", csList_csDate=" + csList_csDate + "]";
	}

}
