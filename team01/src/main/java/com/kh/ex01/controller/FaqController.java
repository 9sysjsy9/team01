package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.FaqService;
import com.kh.ex01.vo.customer.FaqVo;

@Controller
@RequestMapping("/faq")
public class FaqController {

	@Inject
	FaqService faqService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String faqList(Model model) {
		List<FaqVo> list = faqService.selectAll();
		model.addAttribute("list", list);
		return "faq/list";
	}

	@RequestMapping(value = "/customerQna", method = RequestMethod.GET)
	public String customerQna() {
		return "customer/customerQna";
	}

	@RequestMapping(value = "/customerService", method = RequestMethod.GET)
	public String customerService() {
		return "customer/customerService";
	}

	@RequestMapping(value = "/customerServiceEx", method = RequestMethod.GET)
	public String customerServiceEx() {
		return "customer/customerServiceEx";
	}

	@RequestMapping(value = "/customerServiceRt", method = RequestMethod.GET)
	public String customerServiceRt() {
		return "customer/customerServiceRt";
	}

	@RequestMapping(value = "/customerServiceRf", method = RequestMethod.GET)
	public String customerServiceRf() {
		return "customer/customerServiceRf";
	}

}