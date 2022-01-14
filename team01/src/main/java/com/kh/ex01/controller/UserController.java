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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ex01.service.OrderProductService;
import com.kh.ex01.service.UserService;
import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.OrderProductVo;
import com.kh.ex01.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	private UserService userService;
	@Inject
	OrderProductService orderProductService;
	
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
		
		HttpSession session = request.getSession();


		if (userVo == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "fail";
		} else {
			rttr.addFlashAttribute("msg", "success");
			session.setAttribute("userData", userVo);
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
	public String orderList(HttpSession httpSession, Model model) {
		UserVo userVo = (UserVo) httpSession.getAttribute("userData");
		System.out.println("orderList, userVo:"+userVo);
		System.out.println("orderList, userVo: "+userVo);
		if (userVo != null) {
			List<OrderProductVo> list = orderProductService.selectOrder(userVo.getUser_id());
			System.out.println("orderList, list"+list);
			model.addAttribute("list", list);
		}
		return "/user/orderList";
	}
	
	@RequestMapping(value = "/user_basket", method = RequestMethod.GET)
	public String userBasket() {
		
		return "user/user_basket";
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
