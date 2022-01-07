package com.kh.ex01.vo;

public class QnaVo {
	private String qna_title;
	private String qna_content;
	private int qna_no;

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	@Override
	public String toString() {
		return "QnaVo [qna_title=" + qna_title + ", qna_content=" + qna_content + ", qna_no=" + qna_no + "]";
	}

}
