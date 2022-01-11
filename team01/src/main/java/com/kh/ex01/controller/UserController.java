package com.kh.ex01.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ex01.service.UserService;
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

	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(UserVo userVo2, HttpServletRequest request, RedirectAttributes rttr) {
		UserVo userVo = userService.loginRun(userVo2);

		if (userVo == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/user/login";
		} else {
			rttr.addFlashAttribute("msg", "success");
			return "redirect:/user/login";
		}

	}

	@RequestMapping(value = "/registForm")
	public String registForm() {
		return null;
	}

	
}
