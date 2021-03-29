package com.project.wellness.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.wellness.search.sevice.SearchService;
import com.project.wellness.search.vo.SearchVO;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	
	@RequestMapping(value="mypage.do", method=RequestMethod.GET)
	public String selectSearch(Model model) throws Exception {
		
		List<SearchVO> list = searchService.selectProgram();
		model.addAttribute("programList",list);
		
		return "mypage";
	}
	
	@RequestMapping(value="delete.do", method=RequestMethod.GET)
	   public String deleteReservaion(@RequestParam("num") int num) throws Exception {
		   
		   searchService.deleteReservaion(num);
		   
		   return "redirect: mypage.do";
	   }
}
