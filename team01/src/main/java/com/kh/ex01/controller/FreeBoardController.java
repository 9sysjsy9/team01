package com.kh.ex01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/free")
public class FreeBoardController {
	
	@RequestMapping(value = "/free_list", method = RequestMethod.GET)
	 public String freeList() {
		 return "/company/board/free/free_list";
	 }
	
	@RequestMapping(value = "/free_regist", method = RequestMethod.GET)
	public String freeRegist() {
		return "/company/board/free/free_regist";
	}
}
