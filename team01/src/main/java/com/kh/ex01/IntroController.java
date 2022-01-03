package com.kh.ex01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/intro")
public class IntroController {

	 @RequestMapping(value = "/intro_introd", method = RequestMethod.GET)
	 public String hireForm() {
		 return "intro/intro_introd";
	 }
	  
	 @RequestMapping(value = "/intro_greet", method = RequestMethod.GET)
	 public String hireAll() {
		 return "intro/intro_greet";
	 }
	 
	 @RequestMapping(value = "/intro_history", method = RequestMethod.GET)
	 public String hireSearch() {
		 return "intro/intro_history";
	 }
}
