package com.project.wellness.member.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.wellness.member.service.MemberService;
import com.project.wellness.member.vo.MemberVO;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	//회원가입 form
		@RequestMapping(value = "join.do", method = RequestMethod.GET)
		public String postJoin() throws Exception {
			return "member/join";
		}
	
	//회원가입 post
	@RequestMapping(value = "join.do", method = RequestMethod.POST)
	public String postJoin(MemberVO vo, Model model) throws Exception {
	
		int cnt = service.join(vo);
		model.addAttribute("cnt", cnt);
		return "member/login";
		
	}
}
