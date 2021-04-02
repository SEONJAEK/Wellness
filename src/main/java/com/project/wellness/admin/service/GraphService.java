package com.project.wellness.admin.service;

import java.util.List;

import com.project.wellness.admin.vo.GraphVO;

public interface GraphService {

public List<GraphVO> selectGraph() throws Exception;
public List<GraphVO> graph1() throws Exception;
public List<GraphVO> graph2f() throws Exception;
public List<GraphVO> graph2m() throws Exception;
public void updateRole(GraphVO graphVO);
}
