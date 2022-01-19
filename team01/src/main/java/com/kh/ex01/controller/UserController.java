package com.kh.ex01.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ex01.service.OrderProductService;
import com.kh.ex01.service.UserService;
import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.OrderProductVo;
import com.kh.ex01.vo.UserBasketVo;
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
	
	@RequestMapping(value = "/orderList2", method = RequestMethod.GET)
	public String orderRead() {
		return "/user/orderList2";
	}
	
	@RequestMapping(value = "/goOrderContent", method = RequestMethod.GET)
	public String goOrderContent(UserBasketVo userBasketVo) {
		System.out.println("goOrderContent, UserBasketVo: "+userBasketVo);
		return "/user/orderContent";
	}
	
	@RequestMapping(value = "/orderContent", method = RequestMethod.POST)
	@ResponseBody
	public List<UserBasketVo> orderContent(@RequestParam(value="orderList[]") List<String> orderList,
			HttpSession httpSession) {
		System.out.println("orderContent, orderList: "+orderList);
		if (orderList != null) {
			List<UserBasketVo> list = new ArrayList<>();
			for (String shoes_code : orderList) {
				UserBasketVo userBasketVo = orderProductService.getBasket(shoes_code);
				list.add(userBasketVo);
				System.out.println("orderContent, list: "+list);
				httpSession.setAttribute("list", list);
			}
			return list;
		} 
		return null;
	}
	
	@RequestMapping(value = "/orderResult", method = RequestMethod.GET)
	public String orderResult() {
		return "/user/orderResult";
	}
	
	@RequestMapping(value = "/user_basket", method = RequestMethod.GET)
	public String userBasket(HttpSession httpSession, Model model) {
		UserVo userVo = (UserVo) httpSession.getAttribute("userData");
		if (userVo != null) {
			List<UserBasketVo> list = orderProductService.selectBasket(userVo.getUser_id());
			System.out.println("orderList, list: "+list);
			model.addAttribute("list", list);
		}
		return "user/user_basket";
	}
	
	@RequestMapping(value = "/changeBasketCount", method = RequestMethod.POST)
	@ResponseBody
	public String userBasket(UserBasketVo userBasketVo) {
		//System.out.println("changeBasketCount, UserBasketVo: "+userBasketVo);
		orderProductService.changeBasketCount(userBasketVo);
		int order_count = orderProductService.getBasketCount(userBasketVo.getShoes_code());
		if (order_count == userBasketVo.getOrder_count()) {
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping(value = "/insertBasket", method = RequestMethod.POST)
	@ResponseBody
	public int insertBasket(UserBasketVo userBasketVo) {
		System.out.println("insertBasket, userBasketVo: "+userBasketVo);
		String shoes_code = userBasketVo.getShoes_code();
		String user_id = userBasketVo.getUser_id();
		int cart_count = 0;
		if (shoes_code != null && user_id != null) {
			int shoesecode_count = orderProductService.getBasketShoeseCodeCount(shoes_code);
			System.out.println("shoesecode_count: "+shoesecode_count);
			if (shoesecode_count == 1) {
				orderProductService.plusBasketOrdercount(shoes_code);
				cart_count = orderProductService.getUserBasketCount(user_id);
			} else if (shoesecode_count == 0) {
				orderProductService.insertBasket(userBasketVo);
				cart_count = orderProductService.getUserBasketCount(user_id);
			}
			return cart_count;
		}
		return cart_count;
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
	
	@RequestMapping(value = "/pwChk", method=RequestMethod.POST)
	@ResponseBody
	public UserVo pwChk(String pw, HttpSession session) {
		System.out.println("pw:" + pw);
		UserVo userVo = (UserVo)session.getAttribute("userData");
		if (userVo == null) {
			return null;
		}
		System.out.println("userVo:" + userVo);
		String user_pw = userVo.getUser_pw();
		System.out.println("user_pw:" + user_pw);
		
		if (pw.equals(user_pw)) {
			return userVo;
		} else {
			return null;
		}
		
	}
	
	@RequestMapping(value = "/changeUserInfo", method=RequestMethod.POST)
	public void changeUserInfo(UserVo userVo) {
		System.out.println("changeUserInfo �����");
		System.out.println("UserController, changeUserInfo, userVo: " + userVo);
	}
	
}
