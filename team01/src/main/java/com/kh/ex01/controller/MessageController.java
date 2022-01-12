package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ex01.service.MessageService;
import com.kh.ex01.vo.MemberVo;
import com.kh.ex01.vo.MessageVo;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Inject
	private MessageService messageService;

	@RequestMapping(value = "/company/receiveMessageList")
	public String receiveMessageList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVo loginMemberVo = (MemberVo)session.getAttribute("loginData");
		String receiver = loginMemberVo.getUserid();
		List<MessageVo> list = messageService.receiveMessageList(receiver); //여기서 문제
		model.addAttribute("receiveMessageList", list);
		return "/company/message/receiveMessageList";
	}
	
	@RequestMapping(value = "/company/sendMessageList")
	public String sendMessageList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVo loginMemberVo = (MemberVo)session.getAttribute("loginData");
		String sender = loginMemberVo.getUserid();
		List<MessageVo> list = messageService.sendMessageList(sender);
		model.addAttribute("sendMessageList", list);
		return "/company/message/sendMessageList";
	}
}
