package com.kh.ex01;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	  model.addAttribute("list",list);
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
   
}