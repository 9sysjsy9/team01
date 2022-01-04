package com.kh.ex01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/product")
public class ProductController {

   @RequestMapping(value = "/product_index", method = RequestMethod.GET)
   public String productIndex() {
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
   @RequestMapping(value = "/product_list", method = RequestMethod.GET)
   public String productList() {
	   return "/product/product_list";
   }
   
   
}