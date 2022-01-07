package com.kh.ex01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/company")
public class CompanyController {
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainPage() {
		return "/company/main";
	}

}
