package com.project.wellness.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.ServletRequestUtils;
import com.project.wellness.admin.service.GraphService;
import com.project.wellness.admin.vo.GraphVO;

@Controller
public class GraphController {
	@Autowired
	GraphService graphService;
	
//	@RequestMapping(value="graph.do",method=RequestMethod.GET)
//	   public String graph() {
//	      return "graph";
//	   }
	@RequestMapping(value="graph.do",method=RequestMethod.GET)
		public String selectGraph(HttpServletRequest request,Model model) throws Exception {

				if(request.getSession(false) != null){
					List<GraphVO> graph1 = graphService.graph1();
					List<GraphVO> graph2f = graphService.graph2f();
					List<GraphVO> graph2m = graphService.graph2m();
					
					//페이징 코드
					List<GraphVO> list = graphService.selectGraph();
					PagedListHolder pagedListHolder = new PagedListHolder(list);
					int page = ServletRequestUtils.getIntParameter(request, "p", 0);
					pagedListHolder.setPage(page);
					pagedListHolder.setPageSize(10);
					model.addAttribute("pagedListHolder",pagedListHolder);
	
					//graph에서 javascript로 표를 구현했기에 setAtrribute대신에 objectMapper객체 사용해야 함
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
	
					
					
					
					return "graph";
				}
				
					
				else {
					return "member/login";
				}
						
			}
}

