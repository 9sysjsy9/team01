package com.kh.ex01.vo;

import java.sql.Timestamp;

public class MemberVo {
	
//	기능 담당자 : 고만재
	
	// TYPE NULLABLE DEFAULT
	private String userid; // VARCHAR2(10 BYTE) No 아아디 PRIMARY KEY
	private String userpw; // VARCHAR2(10 BYTE) No 비밀번호
	private String username; // VARCHAR2(14 BYTE) No 이름
	private int eno; // NUMBER(4,0) No 사번
	private String gender; // VARCHAR2(1 BYTE) Yes 성별
	private String phone; // VARCHAR2(14 BYTE) No 전화번호
	private String email; // VARCHAR2(30 BYTE) No 이메일
	private String introduce; // VARCHAR2(200 BYTE)Yes 자기소개
	private String position; // VARCHAR2(14 BYTE) Yes 직급
	private int authority; // NUMBER(1,0) Yes 0 사이트 이용권한
	private String department; // VARCHAR2(14 BYTE) Yes 부서
	private Timestamp regdate; // TIMESTAMP(6) Yes sysdate 가입일
	private String profileimg; //프로필이미지 등록 여부

	private String keyword; //사원 검색 키워드
	private String en; // 사원검색 조건

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getEn() {
		return en;
	}

	public void setEn(String en) {
		this.en = en;
	}

	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}

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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}


	public String getProfileimg() {
		return profileimg;
	}

	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}

	@Override
	public String toString() {
		return "MemberVo [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", eno=" + eno
				+ ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", introduce=" + introduce
				+ ", position=" + position + ", authority=" + authority + ", department=" + department + ", regdate="
				+ regdate + ", profileimg=" + profileimg + ", keyword=" + keyword
				+ ", en=" + en + "]";
	}

	

}
