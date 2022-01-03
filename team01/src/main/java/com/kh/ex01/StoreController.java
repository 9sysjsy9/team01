package com.kh.ex01;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ex01.service.StoreService;
import com.kh.ex01.vo.FranApplyVo;

@Controller

@RequestMapping(value="/store/")
public class StoreController {
	
	@Inject
	private StoreService storeService;
	
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
	@RequestMapping(value="/applyRegistRun")
	public String applyRegistRun(FranApplyVo franApplyVo) {
		System.out.println("StoreController, applyRegistRun, franApplyVo : " + franApplyVo);
		storeService.applyRegistRun(franApplyVo);
		
		return "/store/applyFranchise";
	}
	
	
	

}
