package com.kh.ex01.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ex01.service.HireService;
import com.kh.ex01.vo.HireBoardVo;
import com.kh.ex01.vo.HireVo;
import com.kh.ex01.vo.PagingDto;

@Controller
@RequestMapping("/hire")
public class HireController {
	
	private static final String UPLOAD_PATH = "//192.168.0.234/upload/";
	
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
		 List<HireBoardVo> list = hireService.listAll(pagingDto);
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
	 public String hireNew(Model model, PagingDto pagingDto) {
		 pagingDto.setCount(hireService.getN_Count());
		 pagingDto.setPage(pagingDto.getPage());
		 System.out.println(pagingDto);
		 List<HireBoardVo> list = hireService.listNew(pagingDto);
		 model.addAttribute("list", list);
		 model.addAttribute("pagingDto", pagingDto);
		 return "hire/hire_new";
	 }
	 
	 // 경력 채용공고
	 @RequestMapping(value = "/hire_experience", method = RequestMethod.GET)
	 public String hireExperience(Model model, PagingDto pagingDto) {
		 pagingDto.setCount(hireService.getE_Count());
		 pagingDto.setPage(pagingDto.getPage());
		 List<HireBoardVo> list = hireService.listExperience(pagingDto);
		 model.addAttribute("list", list);
		 model.addAttribute("pagingDto", pagingDto);
		 return "hire/hire_experience";
	 }
	 
	 // 인턴 채용공고
	 @RequestMapping(value = "/hire_intern", method = RequestMethod.GET)
	 public String hireIntern(Model model, PagingDto pagingDto) {
		 pagingDto.setCount(hireService.getI_Count());
		 pagingDto.setPage(pagingDto.getPage());
		 List<HireBoardVo> list = hireService.listIntern(pagingDto);
		 model.addAttribute("list", list);
		 model.addAttribute("pagingDto", pagingDto);
		 return "hire/hire_intern";
	 }
	 
	 // 공고 자세히보기
	 @RequestMapping(value = "/hire_content", method = RequestMethod.GET)
	 public String hireContent(Model model, int bno) {
		 HireBoardVo hireBoardVo = hireService.getHireBoard(bno);
		 model.addAttribute("hireBoardVo", hireBoardVo);
		 return "hire/hire_content";
	 }
	 
	 // 공고 삭제하기
	 @RequestMapping(value = "/delete_HireBoard", method = RequestMethod.GET)
	 public String deleteHireBoard(int bno) {
		 hireService.deleteHireBoard(bno);
		 return "redirect:/hire/hire_all";
	 }
	 
	 // 지원자 보기
	 @RequestMapping(value = "/company/regist_list", method = RequestMethod.GET)
	 public String registList(Model model) {
		 List<HireVo> list = hireService.registList();
		 model.addAttribute("list",list);
		 return "/company/hire/regist_list";
		 
	 }
	 
	 // 지원 등록하기
	 @RequestMapping(value = "/regist_run", method = RequestMethod.POST)
	 public String registRun(HireVo hireVo, RedirectAttributes rttr) throws IOException {
		//이력서 업로드
		String fileName = null;
		MultipartFile uploadFile = hireVo.getUploadFile();
		String originalFileName = uploadFile.getOriginalFilename();
		System.out.println("originalFileName:"+originalFileName);
//		String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
		UUID uuid = UUID.randomUUID();	//UUID 구하기
		fileName = uuid + "_" + originalFileName;
		uploadFile.transferTo(new File(UPLOAD_PATH + "resume/" + fileName));
		hireVo.setFilename(fileName);
		hireService.registRun(hireVo); 
		rttr.addFlashAttribute("message", "regist_success");
		return "redirect:/hire/hire_regist";
	 }
	 
	 // 채용조회
	 @RequestMapping(value = "/hire_search", method = RequestMethod.GET)
	 public String hireSearch() {
		 return "/hire/hire_search";
	 }
	 
	// 지원자 상세내용
	 @RequestMapping(value = "/company/regist_content", method = RequestMethod.GET)
	 public String registBoard(Model model, int hno) {
		 HireVo hireVo = hireService.getBoard(hno);
		 model.addAttribute("hireVo",hireVo);
		 return "/company/hire/regist_content";
	 }
	 
	 // 지원자 삭제
	 @RequestMapping(value = "/company/delete_list", method = RequestMethod.GET)
	 public String deleteBoard(int hno) {
		 hireService.deleteBoard(hno);
		 return "redirect:/hire/company/regist_list";
	 }
	 
	 // 합격 통지
	 @RequestMapping(value = "/company/modify_success", method = RequestMethod.GET)
	 public String modifySuccess(int hno,Model model) {
		 HireVo hireVo = hireService.getBoard(hno);
		 hireService.modifySuccess(hno);
		 model.addAttribute("hireVo",hireVo);
		 return "redirect:/hire/company/regist_content?hno="+hno;
	 }
	 
	 // 불합격 통지
	 @RequestMapping(value = "/company/modify_fail", method = RequestMethod.GET)
	 public String modifyFail(int hno,Model model) {
		 HireVo hireVo = hireService.getBoard(hno);
		 hireService.modifyFail(hno);
		 model.addAttribute("hireVo",hireVo);
		 return "redirect:/hire/company/regist_content?hno="+hno;
	 }
	 
	 
	 // 합격 확인
	 @ResponseBody
	 @RequestMapping(value = "/search_success", method = RequestMethod.GET)
	 public String searchSuccess(String name, String email) {
		 System.out.println("contoller : " + name + email);
		 HireVo hireVo = hireService.searchSuccess(name, email);
		 System.out.println("controllor hireVo :" + hireVo);
		 String state = hireVo.getState();
		 System.out.println("state:" + state);
		 if(state.equals("success")) {
			 return "success";
		 } else if(state.equals("fail")){
			 return "fail";
		 } else {
			 return "stay";
		 }
	 }
	 
	 // 채용공고 리스트
	 @RequestMapping(value = "/company/companyHire_all", method = RequestMethod.GET)
	 public String companyHireAll(Model model, PagingDto pagingDto) {
		 pagingDto.setCount(hireService.getCount());
		 pagingDto.setPage(pagingDto.getPage());
		 List<HireBoardVo> list = hireService.listAll(pagingDto);
		 model.addAttribute("list" , list);
		 model.addAttribute("pagingDto", pagingDto);
		 return "/company/hire/companyHire_all";
	 }
	 
	 // 채용공고 삭제
	 @RequestMapping(value = "/company/delete", method = RequestMethod.GET)
	 public String companyHireAll(int bno) {
		 hireService.deleteHireBoard(bno);
		 return "redirect:/hire/company/companyHire_all";
	 }
	 
}
