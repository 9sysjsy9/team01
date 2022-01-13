package com.kh.ex01.vo;

public class CsCheckVo {

	private String cscheck_cschno;
	private String cscheck_cschcate;
	private String cscheck_cschorder;
	private String cscheck_cschprog;

	public String getCscheck_cschno() {
		return cscheck_cschno;
	}

	public void setCscheck_cschno(String cscheck_cschno) {
		this.cscheck_cschno = cscheck_cschno;
	}

	public String getCscheck_cschcate() {
		return cscheck_cschcate;
	}

	public void setCscheck_cschcate(String cscheck_cschcate) {
		this.cscheck_cschcate = cscheck_cschcate;
	}

	public String getCscheck_cschorder() {
		return cscheck_cschorder;
	}

	public void setCscheck_cschorder(String cscheck_cschorder) {
		this.cscheck_cschorder = cscheck_cschorder;
	}

	public String getCscheck_cschprog() {
		return cscheck_cschprog;
	}

	public void setCscheck_cschprog(String cscheck_cschprog) {
		this.cscheck_cschprog = cscheck_cschprog;
	}

	@Override
	public String toString() {
		return "CsCheckVo [cscheck_cschno=" + cscheck_cschno + ", cscheck_cschcate=" + cscheck_cschcate
				+ ", cscheck_cschorder=" + cscheck_cschorder + ", cscheck_cschprog=" + cscheck_cschprog + "]";
	}

}
