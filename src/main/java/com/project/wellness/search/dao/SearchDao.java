package com.project.wellness.search.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.wellness.search.vo.SearchVO;

@Repository
public class SearchDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public SearchDao() {}

	public List<SearchVO> selectSearch() throws Exception {

		List<SearchVO> list = sqlSession.selectList("Search.selectSearch");
		return list;
	}
	
	public int deleteReservaion(int num) throws Exception {

		int cnt = sqlSession.delete("Search.deleteReservaion", num);
		return cnt;
	}
}
