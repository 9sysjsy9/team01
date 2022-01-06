package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.QnaService;
import com.kh.ex01.vo.QnaVo;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Inject
	QnaService qnaService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String qnaList(Model model) {
		List<QnaVo> list = qnaService.selectAll();
		System.out.println("list: "+list);
		model.addAttribute("list", list);
		return "customer/qna";
	}

}