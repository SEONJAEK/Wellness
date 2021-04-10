package com.project.wellness.member.controller;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.wellness.email.Email;
import com.project.wellness.email.EmailSender;
import com.project.wellness.member.service.MemberService;
import com.project.wellness.member.vo.MemberVO;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private static final boolean Exception = false;
	
	@Inject
	MemberService service;
	
	@Autowired
	private EmailSender emailSender;

	@Autowired
	private Email email;
	
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
	
	
	@RequestMapping(value="loginCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public String loginCheck(@RequestParam(value="userId", required = false) String userId,
							@RequestParam(value="userPass", required = false) String userPass,
							HttpServletRequest request) {
		
		
		JSONObject json = new JSONObject();
		
		//데이터베이스에서 ID PW 체킹하기 전에 값이 적혀져 있지 않은 경우
		if(userId.equals("") || userPass.equals("") || userId == null || userPass == null) {
			json.put("result", "1");
			return json.toJSONString();
		}
		
		MemberVO vo = new MemberVO();
		vo.setUserId(userId);
		vo = service.viewMember(vo);
		
		//vo에 아무것도 담기지 않을 때 (존재하지 않는 아이디를 넣었을 때)
		if(vo == null) {
			json.put("result", "2");
			return json.toJSONString();
		}
		
		//DB에 있는 PW 비교할 경우
		if(!userPass.equals(vo.getUserPass()) || vo == null) {
			json.put("result", "2");
			return json.toJSONString();
		}else{
			json.put("result", "0");
			return json.toJSONString();
		}
	}
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView postLogin(@ModelAttribute MemberVO vo, HttpSession session) throws Exception{
		
		boolean result = service.login(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			mav.setViewName("index");
			mav.addObject("msg","seccess");
		}else {
			mav.setViewName("member/login");
			mav.addObject("msg","failure");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/";
	}

	//회원정보 수정
		@RequestMapping(value = "joinupd.do", method = RequestMethod.GET)
		public String getJoinupd(HttpServletRequest request, Model model) throws Exception {
			String userId = (String)request.getSession().getAttribute("userId");
			MemberVO memberVO = new MemberVO();
			memberVO.setUserId(userId);


			model.addAttribute("update", service.viewMember(memberVO)) ;
			System.out.println("memberREsult : " + service.viewMember(memberVO));
			return "member/joinupd";
		}
		
		@RequestMapping(value = "joinupd.do", method = RequestMethod.POST)
		public String postJoinupd(@ModelAttribute MemberVO vo) throws Exception{
			service.joinupd(vo);
			return "index";
		
	}
		
	// ID 찾기 화면
		@RequestMapping(value = "idfind.do", method = RequestMethod.GET)
		public String idfind() {
			return "member/idfind";
		}

		// ID 찾기
		@RequestMapping(value = "idfind.do", method = RequestMethod.POST)
		public String idfind(@RequestParam("userName")String userName, @RequestParam("email") String email, Model model) {
			MemberVO memberVO = new MemberVO();
			memberVO.setUserName(userName);
			memberVO.setEmail(email);
			
			memberVO = service.idfind(memberVO);
			model.addAttribute("memberVO",memberVO);
			return "member/resultId";
			
		}
		@RequestMapping(value = "resultId.do", method = RequestMethod.POST)
		public String resultId() {
			return "login";
		}		
			
		//비밀번호 찾기
			@RequestMapping(value="pwfind.do", method = RequestMethod.GET)
			public String resultIdForm(){
				return "member/pwfind";
		}

			@RequestMapping(value="findpw.do")
		    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		        ModelAndView mav;
		        String id=(String) paramMap.get("userId");
		        String e_mail=(String) paramMap.get("email");
			        String pw=service.getPw(paramMap);
			        System.out.println(pw);
			        if(pw!=null) {
			            email.setContent("비밀번호는 "+pw+" 입니다.");
		            email.setReceiver(e_mail);
		            email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
		            emailSender.SendEmail(email);
		            mav= new ModelAndView("redirect:login.do");
		            return mav;
		        }else {
		            mav=new ModelAndView("redirect:logout.do");
		            return mav;
		        }
			}

	}