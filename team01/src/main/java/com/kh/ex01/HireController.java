package com.kh.ex01;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.HireService;
import com.kh.ex01.vo.HireVo;
import com.kh.ex01.vo.PagingDto;

@Controller
@RequestMapping("/hire")
public class HireController {
	
	@Inject
	private HireService hireService;

	 // 채용공고
	 @RequestMapping(value = "/hire_home", method = RequestMethod.GET)
	 public String hireHome() {
		 return "hire/hire_home";
	 }
	  
	 // 전체 공고 보기
	 @RequestMapping(value = "/hire_all", method = RequestMethod.GET)
	 public String hireAll(Model model, PagingDto pagingDto) {
		 pagingDto.setCount(hireService.getCount());
		 pagingDto.setPage(pagingDto.getPage());
		 List<HireVo> list = hireService.listAll(pagingDto);
		 model.addAttribute("list" , list);
		 model.addAttribute("pagingDto", pagingDto);
		 return "hire/hire_all";
	 }
	 
	 // 채용 지원하기
	 @RequestMapping(value = "/hire_regist", method = RequestMethod.GET)
	 public String hireResgist() {
		 return "hire/hire_regist";
	 }
	 
	 // 신입 채용공고
	 @RequestMapping(value = "/hire_new", method = RequestMethod.GET)
	 public String hireNew(Model model) {
		 List<HireVo> list = hireService.listNew();
		 model.addAttribute("list", list);
		 return "hire/hire_new";
	 }
	 
	 // 경력 채용공고
	 @RequestMapping(value = "/hire_experience", method = RequestMethod.GET)
	 public String hireExperience(Model model) {
		 List<HireVo> list = hireService.listExperience();
		 model.addAttribute("list", list);
		 return "hire/hire_experience";
	 }
	 
	 // 인턴 채용공고
	 @RequestMapping(value = "/hire_intern", method = RequestMethod.GET)
	 public String hireIntern(Model model) {
		 List<HireVo> list = hireService.listIntern();
		 model.addAttribute("list", list);
		 return "hire/hire_intern";
	 }
}
