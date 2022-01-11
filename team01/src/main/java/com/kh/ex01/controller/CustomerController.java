package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.CustomerService;
import com.kh.ex01.vo.NoticeVo;
import com.kh.ex01.vo.QnaVo;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Inject
	CustomerService customerService;

	// /customer/notice
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String customerNotice(Model model) {
		List<NoticeVo> list = customerService.noticeList();
		model.addAttribute("list", list);
		return "customer/notice";
	}

	@RequestMapping(value = "/csExchange", method = RequestMethod.GET)
	public String csExchange() {
		return "customer/csSub/csExchange";
	}

	@RequestMapping(value = "/csReturn", method = RequestMethod.GET)
	public String csReturn() {
		return "customer/csSub/csReturn";
	}

	@RequestMapping(value = "/csRefund", method = RequestMethod.GET)
	public String csRefund() {
		return "customer/csSub/csRefund";
	}
	
	@RequestMapping(value = "/csReceive", method = RequestMethod.GET)
	public String csReceive() {
		return "customer/csReceive";
	}
	
	@RequestMapping(value = "/csMain", method = RequestMethod.GET)
	public String csMain() {
		return "customer/csMain";
	}
	
	@RequestMapping(value = "/csCheck", method = RequestMethod.GET)
	public String csCheck() {
		return "customer/csCheck";
	}
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qnaList(Model model) {
		List<QnaVo> list = customerService.qnaList();
		System.out.println("list: "+list);
		model.addAttribute("list", list);
		return "customer/qna";
	}

}