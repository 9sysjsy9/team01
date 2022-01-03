package com.kh.ex01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/ask")
public class AskController {

   @RequestMapping(value = "/ask_list", method = RequestMethod.GET)
   public String askList() {
      return "/ask/ask_list";
   }
   
}