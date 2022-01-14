package com.kh.ex01.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ex01.service.OrderProductService;
import com.kh.ex01.vo.OrderProductVo;

@Controller
@RequestMapping("/orderProduct")
public class OrderProductController {
	@Inject
	OrderProductService orderProductService;

	@RequestMapping(value = "/insertOrderProduct", method = RequestMethod.POST)
	@ResponseBody
	public String insertOrderProduct(OrderProductVo orderProductVo) {
			System.out.println("orderProductVo: "+orderProductVo);
			orderProductService.insertOrderProduct(orderProductVo);
			return "success";
	}

}
