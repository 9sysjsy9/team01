package com.kh.ex01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	 @RequestMapping(value = "/customerNotice", method = RequestMethod.GET)
	 public String customerNotice() {
		 return "customer/customerNotice";
	 }
	  
	 @RequestMapping(value = "/customerFaq", method = RequestMethod.GET)
	 public String customerFaq() {
		 return "customer/customerFaq";
	 }
	 
	 @RequestMapping(value = "/personelAsk", method = RequestMethod.GET)
	 public String personelAsk() {
		 return "customer/personelAsk";
	 }
	 
	 @RequestMapping(value = "/ExchangeReturn", method = RequestMethod.GET)
	 public String ExchangeReturn() {
		 return "customer/ExchangeReturn";
	 }
	 
	 @RequestMapping(value = "/Refund", method = RequestMethod.GET)
	 public String Refund() {
		 return "customer/Refund";
	 }
}