package com.project.wellness.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String postLogin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		
		HttpSession session = req.getSession();
		int cnt = service.login(vo);
		
		if(vo == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("member", vo);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}

	
}
