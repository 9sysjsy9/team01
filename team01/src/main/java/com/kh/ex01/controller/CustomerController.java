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

	// /customer/notice
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String customerNotice(Model model) {
		List<NoticeVo> list = noticeService.selectAll();
		model.addAttribute("list", list);
		return "customer/notice";
	}

	// /customer/qna
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String customerQna() {
		return "customer/qna";
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
	
	@RequestMapping(value = "/csMain", method = RequestMethod.GET)
	public String csMain() {
		return "customer/csMain";
	}

}