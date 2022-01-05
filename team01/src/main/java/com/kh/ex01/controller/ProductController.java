package com.kh.ex01.controller;

import java.awt.Dialog.ModalExclusionType;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ex01.service.ProductService;
import com.kh.ex01.vo.PagingDto;
import com.kh.ex01.vo.ProductVo;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/product")
public class ProductController {
	@Inject
	ProductService productService;
	
   @RequestMapping(value = "/product_index", method = RequestMethod.GET)
   public String productIndex(Model model, PagingDto pt) {
	   
	   pt.setCount(productService.getCount());
	   pt.setPage(pt.getPage());
	   List<ProductVo> list = productService.selectAll();
	   model.addAttribute("list", list);
	   model.addAttribute("pt", pt);
	   System.out.println("list: "+list);
	   System.out.println("pt: "+pt);
      return "/product/product_index";
   }
   @RequestMapping(value = "/product_ask", method = RequestMethod.GET)
   public String productAsk() {
	   return "/product/product_ask";
   }
   @RequestMapping(value = "/product_detail", method = RequestMethod.GET)
   public String productDetail() {
	   return "/product/product_detail";
   }
   
}