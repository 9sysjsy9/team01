package com.kh.ex01.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.OrderProductService;
import com.kh.ex01.service.ProductService;
import com.kh.ex01.util.MyFileUploadUtil;
import com.kh.ex01.vo.PagingDto;
import com.kh.ex01.vo.ProductVo;
import com.kh.ex01.vo.ShoesCategoryVo;
import com.kh.ex01.vo.ShoesColorVo;
import com.kh.ex01.vo.ShoesSizeVo;
import com.kh.ex01.vo.ShoesStateVo;
import com.kh.ex01.vo.ShoesStyleVo;
import com.kh.ex01.vo.UserVo;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/product")
public class ProductController {
	@Inject
	ProductService productService;
	@Inject
	OrderProductService orderProductService;
	
	@RequestMapping(value = "/product_index", method = RequestMethod.GET)
	public String productIndex(Model model, PagingDto pt, HttpSession httpSession) {
		pt.setCount(productService.getCount());
		pt.setPage(pt.getPage());
		System.out.println("pt: " + pt);
		UserVo userVo = (UserVo) httpSession.getAttribute("userData");
		System.out.println("product_index, userVo: "+userVo);
		if (userVo != null) {
			int cart_count = orderProductService.getUserBasketCount(userVo.getUser_id());
			model.addAttribute("cart_count", cart_count);
		} 
		List<ProductVo> list = productService.selectAll(pt);
		System.out.println("list: " + list);
		model.addAttribute("list", list);
		model.addAttribute("pt", pt);
		return "/product/product_index";
	}

	@RequestMapping(value = "/company/product_list", method = RequestMethod.GET)
	public String productList(Model model) {
		List<ProductVo> list = productService.simpleSelectAll();
		model.addAttribute("list", list);
		return "/company/product/product_list";
	}

	@RequestMapping(value = "/company/product_regist", method = RequestMethod.GET)
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
	
	@RequestMapping(value = "/product_ask", method = RequestMethod.GET)
	public String productAsk() {
		return "/product/product_ask";
	}

	@RequestMapping(value = "/product_detail", method = RequestMethod.GET)
	public String productDetail(String shoes_code, Model model, HttpSession httpSession) {
		UserVo userVo = (UserVo) httpSession.getAttribute("userData");
		System.out.println("product_detail, userVo: "+userVo);
		if (userVo != null) {
			int cart_count = orderProductService.getUserBasketCount(userVo.getUser_id());
			model.addAttribute("cart_count", cart_count);
		} 
		ProductVo productVo = productService.getContent(shoes_code);
		model.addAttribute("productVo", productVo);
		return "/product/product_detail";
	}
	
	@RequestMapping(value = "/company/regist_run", method = RequestMethod.GET)
	public String registRun(ProductVo productVo) {
		System.out.println("regist_run, productVo: "+productVo);
		productService.insertProduct(productVo);
		return "redirect:/product/company/product_list";
	}
	
	@RequestMapping(value = "/company/delete_run", method = RequestMethod.GET)
	public String deleteRun(ProductVo productVo) throws Exception {
		System.out.println("delete_run, getShoes_code: "+ productVo.getShoes_code());
		System.out.println("delete_run, getShoes_image: "+ productVo.getShoes_image());
		productService.deleteProduct(productVo);
		return "redirect:/product/company/product_list";
	}

}