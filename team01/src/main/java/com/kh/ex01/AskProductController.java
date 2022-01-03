package com.kh.ex01;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.AskProductService;
import com.kh.ex01.vo.AskProductVo;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/ask")
public class AskProductController {
	@Inject
	AskProductService askProductService;
	
   @RequestMapping(value = "/ask_list", method = RequestMethod.GET)
   public String askList(Model model) {
	  List<AskProductVo> list = askProductService.selectAll();
	  System.out.println("list: "+list);
	  model.addAttribute("list",list);
      return "/ask/ask_list";
   }
   
}