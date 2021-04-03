package com.project.wellness.intro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class introController {
	@RequestMapping(value="intro.do",method=RequestMethod.GET)
	   public String index() throws Exception {
	      return "intro";
	   }
	
}

