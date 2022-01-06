package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.ProductService;
import com.kh.ex01.vo.ProductVo;
import com.kh.ex01.vo.ShoesCategoryVo;
import com.kh.ex01.vo.ShoesColorVo;
import com.kh.ex01.vo.ShoesSizeVo;
import com.kh.ex01.vo.ShoesStateVo;
import com.kh.ex01.vo.ShoesStyleVo;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Inject
	ProductService productService;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPage() {
		return "/company/main";
	}

	@RequestMapping("/login")
	public String login() {
		return "/company/member/login";
	}

	@RequestMapping(value = "/product_list", method = RequestMethod.GET)
	public String productList(Model model) {
		List<ProductVo> list = productService.simpleSelectAll();
		model.addAttribute("list", list);
		return "/company/product/product_list";
	}

	@RequestMapping(value = "/product_regist", method = RequestMethod.GET)
	public String productRegist(Model model) {
		List<ShoesStyleVo> listStyle = productService.selectAllShoesStyle();
		List<ShoesStateVo> listState = productService.selectAllShoesState();
		List<ShoesColorVo> listColor = productService.selectAllShoesColor();
		List<ShoesCategoryVo> listCategory = productService.selectAllShoesCategory();
		List<ShoesSizeVo> listSize = productService.selectAllShoesSize();
		model.addAttribute("listStyle", listStyle);
		model.addAttribute("listState", listState);
		model.addAttribute("listColor", listColor);
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSize", listSize);
		return "/company/product/product_regist";
	}

}
