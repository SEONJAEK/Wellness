package com.project.wellness.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GraphController {
	@RequestMapping(value="graph.do",method=RequestMethod.GET)
	   public String graph() {
	      return "graph";
	   }
}
