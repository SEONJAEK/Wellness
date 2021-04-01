package com.project.wellness.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
		
		System.out.println(vo);
		System.out.println(model);
		int cnt = service.join(vo);
		model.addAttribute("cnt", cnt);
		return "member/login";
		
	}
	
	//로그인
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String postLogin() throws Exception {
		return "member/login";
	}
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView postLogin(@ModelAttribute MemberVO vo, HttpSession session) throws Exception{
		
		boolean result = service.login(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			mav.setViewName("mypage");
			mav.addObject("msg","seccess");
		}else {
			mav.setViewName("member/login");
			mav.addObject("msg","failure");
		}
		
		return mav;
	}
	
//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	public String logout(HttpSession session) throws Exception{
//		
//		session.invalidate();
//		
//		return "redirect:/";
//	}
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/";
	}

	
	@RequestMapping(value = "joinupd.do", method = RequestMethod.GET)
	public String postJoinupd() throws Exception {
		return "member/joinupd";
	}
}
