package com.kh.ex01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

@RequestMapping(value="/store")
public class StoreController {
	
	@RequestMapping(value="/findStore")
	public String findStore() {
		
		return "/store/findStore";
	}
	
	@RequestMapping(value="/applyFranchise")
	public String applyFranchise() {
		
		return "/store/applyFranchise";
	}
	
	
	

}
