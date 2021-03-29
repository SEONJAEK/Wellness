package com.project.wellness.program.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProgramController {
	@RequestMapping(value="schedule.do",method=RequestMethod.GET)
	   public String graph() {
	      return "schedule";
	   }
}
