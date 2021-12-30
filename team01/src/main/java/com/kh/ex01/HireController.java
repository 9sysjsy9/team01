package com.kh.ex01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/hire")
public class HireController {

	 @RequestMapping(value = "/hire_form", method = RequestMethod.GET)
	 public String hireForm() {
		 return "hire/hire_form";
	 }
	  
	 @RequestMapping(value = "/hire_all", method = RequestMethod.GET)
	 public String hireAll() {
		 return "hire/hire_all";
	 }
	 
	 @RequestMapping(value = "/hire_search", method = RequestMethod.GET)
	 public String hireSearch() {
		 return "hire/hire_search";
	 }
}
