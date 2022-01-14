package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@ResponseBody
	@RequestMapping(value = "/company/sendMessageRun", method=RequestMethod.POST)
	public String sendMessageRun(MessageVo messageVo) {
		System.out.println("MessageController, snedMesageRun, messageVo : " + messageVo);
		messageService.sendMessageRun(messageVo);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value = "/company/getMessageData", method=RequestMethod.POST)
	public MessageVo getMessageData(int mno, String reader) {
		System.out.println("reader : " + reader);
		if(reader.equals("receiver")) {
			System.out.println("수신자 읽음");
			messageService.readStateChange(mno);
		} else if (reader.equals("sender")) {
			
		}
		MessageVo messageVo = messageService.getMessageData(mno);
		return messageVo ;
	}
	
	@ResponseBody
	@RequestMapping(value = "/company/messageDeleteRun", method = RequestMethod.POST)
	public String messageDeleteRun(int mno, String reader) {
		System.out.println("reader : " + reader);
		if(reader.equals("sender")) {
			messageService.senderDeleteStateChange(mno);
		} else if (reader.equals("receiver")){
			messageService.receiverDeleteStateChange(mno);
		}
		return "success";
	};
	
	@ResponseBody
	@RequestMapping(value = "/company/messageSendCancel", method = RequestMethod.POST)
	public String messageSendCancel(int mno) {
		System.out.println("mno : " + mno);
		messageService.messageSendCancel(mno);
		return "success";
	};
}
