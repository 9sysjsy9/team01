package com.kh.ex01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

@RequestMapping(value="/store")
public class StoreController {
	
	//매장 찾기 페이지
	@RequestMapping(value="/findStore")
	public String findStore() {
		
		return "/store/findStore";
	}
	
	//가맹 문의 페이지
	@RequestMapping(value="/applyFranchise")
	public String applyFranchise() {
		
		return "/store/applyFranchise";
	}
	
	//가맹점 문의서 제출
	@RequestMapping(value="/applyRegist")
	public String applyRegist() {
		
		return "/store/applyFranchise";
	}
	
	
	

}
