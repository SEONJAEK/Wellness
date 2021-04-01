package com.project.wellness.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.wellness.reservation.sevice.ReservationService;
import com.project.wellness.reservation.vo.ReservationVO;

@Controller
public class ReservationController {

	@Autowired
	ReservationService reservationService;
	
	@RequestMapping(value="mypage.do", method=RequestMethod.GET)
	public String selectReservation(Model model) throws Exception {
		
		List<ReservationVO> list = reservationService.selectReservation();
		model.addAttribute("programList",list);
		
		return "mypage";
	}
	
	@RequestMapping(value="delete.do", method=RequestMethod.GET)
	   public String deleteReservation(@RequestParam("num") int num) throws Exception {
		   
		reservationService.deleteReservation(num);
		   
		   return "redirect: mypage.do";
	   }
	
	@RequestMapping(value="reservation.do", method=RequestMethod.GET)
	public String selectReservation() {
		return "calendar";
	}
	
//	@RequestMapping(value="reservation.do", method=RequestMethod.POST)
//	@ResponseBody
//	public String insertReservation(String regDate, String programId, HttpServletRequest request) throws Exception {
//		
//		regDate = request.getParameter(regDate);
//		programId = request.getParameter(programId);
//		
//		return "redirect:reservation.do";
//	}
}
