package com.kh.ex01;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

   @RequestMapping(value = "/index", method = RequestMethod.GET)
   public String index() {
      return "index";
   }
   @RequestMapping(value = "/index2", method = RequestMethod.GET)
   public String index2() {
      return "index2";
   }
   @RequestMapping(value = "/index3", method = RequestMethod.GET)
   public String index3() {
      return "index2";
   }
   
}