package com.kh.ex01.vo;

import org.springframework.web.multipart.MultipartFile;

public class HireVo {

	private int hno;
	private String name;
	private String email;
	private String phonenum;
	private String career;
	private String content;
	private String state;
	private String result; // 합/불 확인
	private String fileName; // 파일저장이름
	private MultipartFile uploadFile;
	
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhonnum() {
		return phonenum;
	}
	public void setPhonnum(String phonnum) {
		this.phonenum = phonnum;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getFilename() {
		return fileName;
	}
	public void setFilename(String filename) {
		this.fileName = filename;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	@Override
	public String toString() {
		return "HireVo [hno=" + hno + ", name=" + name + ", email=" + email + ", phonenum=" + phonenum + ", career="
				+ career + ", content=" + content + ", state=" + state + ", result=" + result + ", fileName=" + fileName
				+ ", uploadFile=" + uploadFile + "]";
	}
	
	
}