package com.project.wellness.reservation.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value="reservation.do", method=RequestMethod.POST)
	@ResponseBody	//ajax post 방식 할 때 꼭 써줘야함
	public int insertReservation(Date regDate, String programId) throws Exception {
		
		System.out.println(regDate);
		System.out.println(programId);
		
		ReservationVO vo = new ReservationVO();
		vo.setRegDate(regDate);
		vo.setProgramId(programId);
		int cnt = reservationService.insertReservation(vo);
		return cnt;
		
//		JSONObject jsonObject = new JSONObject();
//		jsonObject.put("regDate",vo.getRegDate());
//		jsonObject.put("programId", vo.getProgramId());
	}
}
