package com.kh.ex01.vo;

import java.sql.Timestamp;

public class FranApplyVo {
	private int fno; // NUMBER PK
	private String email; // VARCHAR2(30 BYTE) NN
	private String phone; // VARCHAR2(14 BYTE) NN
	private String applyContent;// VARCHAR2(1000 BYTE) NN
	private String replyContent;// VARCHAR2(1000 BYTE)
	private String replyState; // VARCHAR2(1 BYTE) default 'n' chk('y'or'n')
	private Timestamp regDate; // TIMESTAMP(6) default sysdate
	private Timestamp replyDate;// TIMESTAMP(6)

	public FranApplyVo() {
		super();
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getApplyContent() {
		return applyContent;
	}

	public void setApplyContent(String applyContent) {
		this.applyContent = applyContent;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyState() {
		return replyState;
	}

	public void setReplyState(String replyState) {
		this.replyState = replyState;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public Timestamp getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Timestamp replyDate) {
		this.replyDate = replyDate;
	}

	@Override
	public String toString() {
		return "franapplyVo [fno=" + fno + ", email=" + email + ", phone=" + phone + ", applyContent=" + applyContent
				+ ", replyContent=" + replyContent + ", replyState=" + replyState + ", regDate=" + regDate
				+ ", replyDate=" + replyDate + "]";
	}

}
