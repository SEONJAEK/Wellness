package com.project.wellness.reservation.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.wellness.member.vo.MemberVO;
import com.project.wellness.reservation.sevice.ReservationService;
import com.project.wellness.reservation.vo.ReservationVO;

@Controller
public class ReservationController {

   @Autowired
   ReservationService reservationService;
   
   //예약 조회
   @RequestMapping(value="mypage.do", method=RequestMethod.GET)
   public String selectReservation(HttpServletRequest request, @ModelAttribute ReservationVO vo, Model model) throws Exception {
      
	   if(request.getSession() != null ){
         if(request.getSession().getAttribute("userId") != null ) {
            
        	 vo.setUserId((String) request.getSession().getAttribute("userId"));
            
        	 List<ReservationVO> list = reservationService.selectReservation(vo);
           
        	PagedListHolder pagedListHolder = new PagedListHolder(list);
    		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
    		pagedListHolder.setPage(page);
    		pagedListHolder.setPageSize(10);
    		
    		model.addAttribute("pagedListHolder",pagedListHolder);
            
            return "reservation/mypage";
         }
         else {
            return "member/login";
         }
         
      }else {
         return "member/login";
      }
   }
   
   //예약 취소
   @RequestMapping(value="delete.do", method=RequestMethod.GET)
      public String deleteReservation(@RequestParam("num") int num) throws Exception {
         
	   	 reservationService.deleteReservation(num);
         
         return "redirect: mypage.do";
      }
   
   //요가 예약페이지
   @RequestMapping(value="reservationYoga.do", method=RequestMethod.GET)
   public String selectReservationYoga() {
      return "reservation/calendarYoga";
   }
   
   //필라테스 예약페이지
   @RequestMapping(value="reservationPilates.do", method=RequestMethod.GET)
   public String selectReservationPilates() {
      return "reservation/calendarPilates";
   }
   
   //에어로빅 예약페이지
   @RequestMapping(value="reservationAerobic.do", method=RequestMethod.GET)
   public String selectReservationAerobic() {
      return "reservation/calendarAerobic";
   }
   

   @RequestMapping(value="reservation.do", method=RequestMethod.POST)
   @ResponseBody
   public int insertReservation(HttpServletRequest request,
		   						Date regDate,
		   						String programId) throws Exception {
      int cnt = 0;
	   if(request.getSession() != null ){
		   if(request.getSession().getAttribute("userId") != null ) {
			    ReservationVO vo = new ReservationVO();        
			    vo.setUserId((String) request.getSession().getAttribute("userId"));
				vo.setRegDate(regDate);
				vo.setProgramId(programId);
				cnt = reservationService.insertReservation(vo);
				return cnt;
		   }
	   } return cnt;
	}
}