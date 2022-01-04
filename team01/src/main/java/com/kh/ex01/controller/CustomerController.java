package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.NoticeService;
import com.kh.ex01.vo.NoticeVo;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	 @Inject
	 NoticeService noticeService;
	 
	 @RequestMapping(value = "/customerNotice", method = RequestMethod.GET)
	 public String customerNotice(Model model) {
		 List<NoticeVo> list = noticeService.selectAll();
		 model.addAttribute("list", list);
		 return "customer/customerNotice";
	 }
	  
	 @RequestMapping(value = "/customerQna", method = RequestMethod.GET)
	 public String customerQna() {
		 return "customer/customerQna";
	 }
	 
	 @RequestMapping(value = "/customerService", method = RequestMethod.GET)
	 public String customerService() {
		 return "customer/customerService";
	 }
	 
}