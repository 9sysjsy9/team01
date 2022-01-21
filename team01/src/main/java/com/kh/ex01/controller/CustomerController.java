package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ex01.service.CustomerService;
import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.CsreceiveVo;
import com.kh.ex01.vo.NoticeVo;
import com.kh.ex01.vo.QnaVo;
import com.kh.ex01.vo.UserVo;

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


	@RequestMapping(value = "/csRefund", method = RequestMethod.GET)
	public String csRefund() {
		return "customer/csSub/csRefund";
	}

	@RequestMapping(value = "/csReceive", method = RequestMethod.GET)
	public String csReceive() {
		return "customer/csReceive";
	}
	
	@RequestMapping(value = "/csReceive2", method = RequestMethod.GET)
	public String csReceive2() {
		return "customer/csReceive2";
	}
	
	@RequestMapping(value = "/csMain", method = RequestMethod.GET)
	public String csMain() {
		return "customer/csMain";
	}
	
	@RequestMapping(value = "/mine", method = RequestMethod.GET)
	public String mine() {
		return "user/mine";
	}
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String orderList() {
		return "user/orderList";
	}
	
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qnaList(Model model, String keyword) {
		System.out.println("CustomerController, qnaList, keyword: " + keyword);
		List<QnaVo> list = customerService.qnaList(keyword);
		System.out.println("list: "+list);
		model.addAttribute("list", list);
		return "customer/qna";
	}
	
	@RequestMapping(value = "/company/csList")
	public String csList(Model model) {
		List<AskProductVo> list = customerService.csList();
		System.out.println("AskProductlist: "+list);
		model.addAttribute("csList", list);
		return "/company/csManage/csList";
	}
	
	@RequestMapping(value = "/csCheck")
	public String csCheck(Model model) {
		List<AskProductVo> list = customerService.csList();
		System.out.println("AskProductVo list: "+list);
		model.addAttribute("list", list);
		return "/customer/csCheck";
	}
	
	@RequestMapping(value = "/csUpdate", method = RequestMethod.POST)
	public String csUpdate(int ano, String ask_reply, RedirectAttributes rttr) {
		System.out.println("CustomerController, csUpdate, ano: " + ano);
		System.out.println("CustomerController, csUpdate, ask_reply: " + ask_reply);
		customerService.csUpdate(ano, ask_reply);
		rttr.addFlashAttribute("message", "success");
		return "redirect:/customer/company/csList";
	}
	
	@RequestMapping(value = "/csReturn", method = RequestMethod.GET)
	public String csReturn() {
		return "customer/csSub/csReturn";
	}
	
	@ResponseBody
	@RequestMapping(value = "/askRegistRun", method=RequestMethod.POST)
	public String askRegistRun(AskProductVo askProductVo) {
//		System.out.println("UserController, askRegistRun, askProductVo : " + askProductVo);
//		userService.askRegistRun(askProductVo);
//		return "success";
		return null;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkOrderCode", method=RequestMethod.POST)
	public String checkOrderCode(String order_code) {
		System.out.println("CustomerController, checkOrderCode, order_code : " + order_code);
		int count = customerService.checkOrderCode(order_code);
		System.out.println("CustomerController, checkOrderCode, count : " + count);
		
		return String.valueOf(count);
	}
	
	@RequestMapping(value = "/insertCsReceive", method=RequestMethod.POST)
	public String insertCsReceive(CsreceiveVo csreceiveVo, HttpSession session) {
		System.out.println("CustomerController, insertCsReceive, csreceiveVo : " + csreceiveVo);
		UserVo userVo = (UserVo)session.getAttribute("userData");
		String user_id = userVo.getUser_id();
		csreceiveVo.setUser_id(user_id);
		customerService.insertCsReceive(csreceiveVo);
		
//		CsReceiveUserVo csReceiveUserVo = customerService.checkCsNum(cs_num);
//		System.out.println("CustomerController, checkCsNum, csReceiveUserVo : " + csReceiveUserVo);
//		return csReceiveUserVo;
		return "redirect:/customer/csReceive";
	}
	

}