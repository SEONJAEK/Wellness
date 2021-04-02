package com.project.wellness.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.wellness.admin.dao.GraphDao;
import com.project.wellness.admin.vo.GraphVO;

@Service
public class GraphServiceImpl implements GraphService {

	@Autowired
	GraphDao graphDao;
	
	@Override
	public List<GraphVO> selectGraph() throws Exception {
		
		List<GraphVO> list = graphDao.selectGraph();
		return list;
	}
	
	@Override
	public List<GraphVO> graph1() throws Exception {
			
			List<GraphVO> graph1 = graphDao.graph1();
			return graph1;
	}
	

	@Override
	public List<GraphVO> graph2f() throws Exception {
			
			List<GraphVO> graph2 = graphDao.graph2f();
			return graph2;
		}
	
	@Override
	public List<GraphVO> graph2m() throws Exception {
			
			List<GraphVO> graph2 = graphDao.graph2m();
			return graph2;
		}
	@Override
	public void updateRole(GraphVO graphVO) {
		graphDao.updateRole(graphVO);
	}
	
	}

