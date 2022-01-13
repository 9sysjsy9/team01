package com.kh.ex01.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ex01.service.UserService;
import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	private UserService userService;

	@RequestMapping("/login")
	public String login() {
		return "/user/login";
	}
	
	@RequestMapping(value="/login_check",  method = RequestMethod.GET)
	public String login_check() {
		return "/user/login";
	}

	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	@ResponseBody
	public String loginRun(UserVo userVo2, HttpServletRequest request, RedirectAttributes rttr) {
		UserVo userVo = userService.loginRun(userVo2);

		if (userVo == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "fail";
		} else {
			rttr.addFlashAttribute("msg", "success");
			return "success";
		}
	}
	
	@RequestMapping(value="/register",  method = RequestMethod.GET)
	public String register() {
		return "/user/register";
	}
	
	@ResponseBody
	@RequestMapping(value = "/userRegistRun", method = RequestMethod.POST)
	public String userRegistRun(UserVo userVo) {
		System.out.println("UserController, userRegistRun, userVo : " + userVo);
		userService.userRegistRun(userVo);
		return "success";
	}
	
	@RequestMapping(value = "/mine", method = RequestMethod.GET)
	public String mine() {
		return "user/mine";
	}
	
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String orderList() {
		return "user/orderList";
	}

	@ResponseBody
	@RequestMapping(value = "/checkOrderNum", method=RequestMethod.POST)
	public UserVo checkOrderNum(String order_code) {
		System.out.println("UserController, checkOrderNum, order_code : " + order_code);
		UserVo userVo = userService.checkOrderNum(order_code);
		System.out.println("UserController, checkOrderNum, userVo : " + userVo);
		return userVo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/askRegistRun", method=RequestMethod.POST)
	public String askRegistRun(AskProductVo askProductVo) {
		System.out.println("UserController, askRegistRun, askProductVo : " + askProductVo);
		userService.askRegistRun(askProductVo);
		return "success";
		
	}
	
	
}
