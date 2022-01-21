package com.kh.ex01.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
		if (orderProductVo.getUser_id() != null && orderProductVo.getOrder_shoescode() != null 
				&& orderProductVo.getOrder_count() != 0) {
			orderProductService.insertOrderProduct(orderProductVo);
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping(value = "/getOrderCodeCount", method = RequestMethod.POST)
	@ResponseBody
	public int getOrderCodeCount(OrderProductVo orderProductVo) {
		int count = 0;
		System.out.println("orderProductVo: "+orderProductVo);	
		String order_code = orderProductVo.getOrder_code();
		if (order_code != null ) {
			count = orderProductService.getOrderCodeCount(order_code);
			return count;
		}
			
		return count;
	}

}
