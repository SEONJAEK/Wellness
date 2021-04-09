package com.project.wellness.admin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.ServletRequestUtils;
import com.project.wellness.admin.service.GraphService;
import com.project.wellness.admin.vo.GraphVO;
import com.project.wellness.reservation.sevice.ReservationService;
import com.project.wellness.reservation.vo.ReservationVO;

@Controller
public class GraphController {
	@Autowired
	GraphService graphService;
	
	@Autowired
	ReservationService reservationService;

	
	@RequestMapping(value="graph.do",method=RequestMethod.GET)
	public String selectGraph(HttpServletRequest request,Model model) throws Exception {
		//관리자 세션일 경우
		if(request.getSession() != null ){
			if(request.getSession().getAttribute("isAdmin") != null ) {
				if((Integer)request.getSession().getAttribute("isAdmin") == 1 ){
					//graphService를 통해 해당하는 값을 List형태로 저장
					List<GraphVO> graph1 = graphService.graph1();
					List<GraphVO> graph2f = graphService.graph2f();
					List<GraphVO> graph2m = graphService.graph2m();
					
					//graph에서 javascript로 표를 구현했기에 setAtrribute대신에 objectMapper객체 사용해야 함
					//model을 통해 graph.jsp로 넘길 값을 지정
					ObjectMapper objectMapper = new ObjectMapper();
					model.addAttribute("count_male", objectMapper.writeValueAsString(graph1.get(0).getCount_male()));
					model.addAttribute("count_female", objectMapper.writeValueAsString(graph1.get(0).getCount_female()));
					
					model.addAttribute("m_ten", objectMapper.writeValueAsString(graph2m.get(0).getM_ten()));
					model.addAttribute("m_twenty", objectMapper.writeValueAsString(graph2m.get(0).getM_twenty()));
					model.addAttribute("m_thirty", objectMapper.writeValueAsString(graph2m.get(0).getM_thirty()));
					model.addAttribute("m_fourty", objectMapper.writeValueAsString(graph2m.get(0).getM_fourty()));
					model.addAttribute("m_fifty", objectMapper.writeValueAsString(graph2m.get(0).getM_fifty()));
					model.addAttribute("m_other", objectMapper.writeValueAsString(graph2m.get(0).getM_other()));
					
					model.addAttribute("f_ten", objectMapper.writeValueAsString(graph2f.get(0).getF_ten()));
					model.addAttribute("f_twenty", objectMapper.writeValueAsString(graph2f.get(0).getF_twenty()));
					model.addAttribute("f_thirty", objectMapper.writeValueAsString(graph2f.get(0).getF_thirty()));
					model.addAttribute("f_fourty", objectMapper.writeValueAsString(graph2f.get(0).getF_fourty()));
					model.addAttribute("f_fifty", objectMapper.writeValueAsString(graph2f.get(0).getF_fourty()));
					model.addAttribute("f_other", objectMapper.writeValueAsString(graph2f.get(0).getF_other()));
					
					return "admin/graph";
				}
				else {
					return "redirect:/";
				}
			}
			else {
				return "member/login";
			}
		}else {
			return "member/login";
		}
	}

	@RequestMapping(value="member_admin.do",method=RequestMethod.GET)
	public String memberAdmin(HttpServletRequest request,Model model) throws Exception {

			if(request.getSession() != null ){
				if(request.getSession().getAttribute("isAdmin") != null ) {
					if((Integer)request.getSession().getAttribute("isAdmin") == 1 ){
						
						
						//페이징 코드
						List<GraphVO> list = graphService.selectGraph();
						PagedListHolder pagedListHolder = new PagedListHolder(list);
						int page = ServletRequestUtils.getIntParameter(request, "p", 0);
						pagedListHolder.setPage(page);
						pagedListHolder.setPageSize(10);
						model.addAttribute("pagedListHolder",pagedListHolder);
						
						
						
						return "admin/member";
					}
					else {
						return "redirect:/";
					}
					
				}
				else {
					return "member/login";
				}
				
					
			}
			
				
			else {
				return "member/login";
			}
					
		}
	
	
	
//	@RequestMapping(value="reservation_admin.do", method=RequestMethod.GET)
//	public String extractReservation1(HttpServletRequest request, Model model) throws Exception {
//		if(request.getSession() != null ){
//			if(request.getSession().getAttribute("isAdmin") != null ) {
//				if((Integer)request.getSession().getAttribute("isAdmin") == 1 ){
//					String date = (String)request.getParameter("date");
//					if(date!=null){
//						
//						List<ReservationVO> list = reservationService.selectReservationByDate(date);
//						PagedListHolder pagedListHolder = new PagedListHolder(list);
//						int page = ServletRequestUtils.getIntParameter(request, "p", 0);
//						pagedListHolder.setPage(page);
//						pagedListHolder.setPageSize(10);
//						model.addAttribute("pagedListHolder",pagedListHolder);
//						model.addAttribute("select_date",date);
//						
//						
//						
//						return "admin/reservation";
//					}else {
//						java.sql.Date sqlDate = new java.sql.Date(new Date().getTime());
//						String date_current = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
//						
//						
//						
//						List<ReservationVO> list = reservationService.selectReservationByDate(date_current);
//						PagedListHolder pagedListHolder = new PagedListHolder(list);
//						int page = ServletRequestUtils.getIntParameter(request, "p", 0);
//						pagedListHolder.setPage(page);
//						pagedListHolder.setPageSize(10);
//						model.addAttribute("pagedListHolder",pagedListHolder);
//						
//						model.addAttribute("select_date",date_current);
//						
//						return "admin/reservation";
//					}
//						
//				
//						
////					
//				}
//				else {
//					return "redirect:/";
//				}
//				
//			}
//			else {
//				return "member/login";
//			}
//			
//				
//		}
//		
//			
//		else {
//			return "member/login";
//		}
//				
//	}
	
	public List<ReservationVO>  fillTenItem(List<ReservationVO> list) {
		ReservationVO temp = new ReservationVO(-1,new java.sql.Date(new Date().getTime()) , "","","", "", "", "");
		int list_size = list.size();
		for (int i = list_size; i < 10; i++) {
			list.add(i, temp);
		}
		return list;
	}
//	
	@RequestMapping(value="reservation_admin.do", method=RequestMethod.GET)
	public String extractReservation1(HttpServletRequest request, Model model) throws Exception {
		if(request.getSession() != null ){
			if(request.getSession().getAttribute("isAdmin") != null ) {
				if((Integer)request.getSession().getAttribute("isAdmin") == 1 ){
					String date = (String)request.getParameter("date");
					if(date!=null){
						
						List<ReservationVO> listAerobic1 = fillTenItem(reservationService.selectReservationAerobic1(date));
						List<ReservationVO> listAerobic2 = fillTenItem(reservationService.selectReservationAerobic2(date));
						List<ReservationVO> listPilates1 = fillTenItem(reservationService.selectReservationPilates1(date));
						List<ReservationVO> listPilates2 = fillTenItem(reservationService.selectReservationPilates2(date));
						List<ReservationVO> listYoga1 = fillTenItem(reservationService.selectReservationYoga1(date));
						List<ReservationVO> listYoga2 = fillTenItem(reservationService.selectReservationYoga2(date));
						
						
						
						
//						List<ReservationVO> list = reservationService.selectReservationByDate(date);
//						PagedListHolder pagedListHolder = new PagedListHolder(list);
//						int page = ServletRequestUtils.getIntParameter(request, "p", 0);
//						pagedListHolder.setPage(page);
//						pagedListHolder.setPageSize(10);
						model.addAttribute("listAerobic1",listAerobic1);
						model.addAttribute("listAerobic2",listAerobic2);
						model.addAttribute("listPilates1",listPilates1);
						model.addAttribute("listPilates2",listPilates2);
						model.addAttribute("listYoga1",listYoga1);
						model.addAttribute("listYoga2",listYoga2);
						
						model.addAttribute("select_date",date);
						
						
						
						return "admin/reservation";
					}else {
						java.sql.Date sqlDate = new java.sql.Date(new Date().getTime());
						String date_current = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
						
						List<ReservationVO> try_ten = fillTenItem(reservationService.selectReservationYoga1("2021-04-17"));
						
						List<ReservationVO> listAerobic1 = fillTenItem(reservationService.selectReservationAerobic1(date_current));
						List<ReservationVO> listAerobic2 = fillTenItem(reservationService.selectReservationAerobic2(date_current));
						List<ReservationVO> listPilates1 = fillTenItem(reservationService.selectReservationPilates1(date_current));
						List<ReservationVO> listPilates2 = fillTenItem(reservationService.selectReservationPilates2(date_current));
						List<ReservationVO> listYoga1 = fillTenItem(reservationService.selectReservationYoga1(date_current));
						List<ReservationVO> listYoga2 = fillTenItem(reservationService.selectReservationYoga2(date_current));
						
						model.addAttribute("listAerobic1",listAerobic1);
						model.addAttribute("listAerobic2",listAerobic2);
						model.addAttribute("listPilates1",listPilates1);
						model.addAttribute("listPilates2",listPilates2);
						model.addAttribute("listYoga1",listYoga1);
						model.addAttribute("listYoga2",listYoga2);
						
//						PagedListHolder pagedListHolder = new PagedListHolder(list);
//						int page = ServletRequestUtils.getIntParameter(request, "p", 0);
//						pagedListHolder.setPage(page);
//						pagedListHolder.setPageSize(10);
//						model.addAttribute("pagedListHolder",pagedListHolder);
//						
						model.addAttribute("select_date",date_current);
						
						return "admin/reservation";
					}
						
				
						
//					
				}
				else {
					return "redirect:/";
				}
				
			}
			else {
				return "member/login";
			}
			
				
		}
		
			
		else {
			return "member/login";
		}
				
	}
	
	@RequestMapping(value = "updateRole.do", method = RequestMethod.POST)
	public void updateRole(@ModelAttribute GraphVO vo, HttpServletResponse response) throws Exception{
		graphService.updateRole(vo);
		try {
			response.getWriter().print("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		
	}
	
	
}

