package com.kh.ex01.vo;

import java.sql.Timestamp;

public class MessageVo {

	private int mno; 			// number 				no
	private String sender; 		// varchar2(10 byte) 	yes
	private String receiver; 	// varchar2(10 byte) 	yes
	private String content; 	// varchar2(500 byte)	no
	private String readstate; 	// varchar2(1 byte)		yes 'n'
	private Timestamp senddate; // timestamp(6) 		yes sysdate
	private Timestamp readdate; // timestamp(6) 		yes
	
	private String receivername;
	private String sendername;

	public MessageVo() {
		super();
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReadstate() {
		return readstate;
	}

	public void setReadstate(String readstate) {
		this.readstate = readstate;
	}

	public Timestamp getSenddate() {
		return senddate;
	}

	public void setSenddate(Timestamp senddate) {
		this.senddate = senddate;
	}

	public Timestamp getReaddate() {
		return readdate;
	}

	public void setReaddate(Timestamp readdate) {
		this.readdate = readdate;
	}

	public String getReceivername() {
		return receivername;
	}

	public void setReceivername(String receivername) {
		this.receivername = receivername;
	}

	public String getSendername() {
		return sendername;
	}

	public void setSendername(String sendername) {
		this.sendername = sendername;
	}

	@Override
	public String toString() {
		return "MessageVo [mno=" + mno + ", sender=" + sender + ", receiver=" + receiver + ", content=" + content
				+ ", readstate=" + readstate + ", senddate=" + senddate + ", readdate=" + readdate + ", receivername="
				+ receivername + ", sendername=" + sendername + "]";
	}

}
