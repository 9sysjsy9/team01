package com.kh.ex01;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.AskProductService;
import com.kh.ex01.vo.AskProductVo;
import com.kh.ex01.vo.PagingDto;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/ask")
public class AskProductController {
	@Inject
	AskProductService askProductService;
	
   @RequestMapping(value = "/ask_list", method = RequestMethod.GET)
   public String askList(Model model, PagingDto pt) {
	  pt.setCount(askProductService.getCount());
	  pt.setPage(pt.getPage());
	  System.out.println("pt: "+pt);
	  List<AskProductVo> list = askProductService.selectAll(pt);
	  model.addAttribute("list",list);
	  model.addAttribute("pt", pt);
      return "/ask/ask_list";
   }
   
   @RequestMapping(value = "/ask_content", method = RequestMethod.GET)
   public String askContent(int ano, Model model) {
	   System.out.println("ano: "+ano);
	   AskProductVo askProductVo = askProductService.getContent(ano);
	   System.out.println("askProductVo: "+askProductVo);
	   model.addAttribute("askProductVo", askProductVo);
	   return "/ask/ask_content";
   }
   @RequestMapping(value = "/ask_modify_run", method = RequestMethod.GET)
   public String askModifyRun(AskProductVo askProductVo) {
	   System.out.println("askProductVo: "+askProductVo);
	   askProductService.modifyContent(askProductVo);
	   System.out.println("업데이트 완료");
	   return "redirect:/ask/ask_content?ano="+askProductVo.getAno();
   }
   @RequestMapping(value = "/ask_regist_form", method = RequestMethod.GET)
   public String askRegistForm() {
	   return "/ask/ask_regist_form";
   }
   @RequestMapping(value = "/ask_regist_run", method = RequestMethod.POST)
   public String askRegistRun(AskProductVo askProductVo) {
	   System.out.println("askProductVo: "+askProductVo);
	   askProductService.insertContent(askProductVo);
	   return "redirect:/ask/ask_list";
   }
   @RequestMapping(value = "/ask_delete_run", method = RequestMethod.GET)
   public String askDeleteRun(int ano) {
	   askProductService.deleteContent(ano);
	   return "redirect:/ask/ask_list";
   }
   
}