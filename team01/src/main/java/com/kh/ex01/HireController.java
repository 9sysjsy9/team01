package com.kh.ex01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/hire")
public class HireController {

	 // 채용공고
	 @RequestMapping(value = "/hire_home", method = RequestMethod.GET)
	 public String hireForm() {
		 return "hire/hire_home";
	 }
	  
	 // 전체 공고 보기
	 @RequestMapping(value = "/hire_all", method = RequestMethod.GET)
	 public String hireAll() {
		 return "hire/hire_all";
	 }
	 
	 // 채용 지원하기
	 @RequestMapping(value = "/hire_regist", method = RequestMethod.GET)
	 public String hireSearch() {
		 return "hire/hire_regist";
	 }
}
