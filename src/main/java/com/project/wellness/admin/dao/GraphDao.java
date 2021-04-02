package com.project.wellness.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.wellness.admin.vo.GraphVO;

@Repository
public class GraphDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Inject 
	SqlSession sql;

	public GraphDao() {}

	public List<GraphVO> selectGraph() throws Exception {

		List<GraphVO> list = sqlSession.selectList("Graph.selectGraph");
		return list;
	}
	
	public List<GraphVO> graph1() throws Exception {

		List<GraphVO> graph1 = sqlSession.selectList("Graph.graph1");
		return graph1;
	}
	
	public List<GraphVO> graph2f() throws Exception {

		List<GraphVO> graph2 = sqlSession.selectList("Graph.graph2f");
		return graph2;
	}
	
	public List<GraphVO> graph2m() throws Exception {

		List<GraphVO> graph2 = sqlSession.selectList("Graph.graph2m");
		return graph2;
	}
	
	public void updateRole(GraphVO graphVO) {
		sql.update("Graph.updateRole", graphVO);
	}
	
	
}
