package com.project.wellness.search.sevice;

import java.util.List;

import com.project.wellness.search.vo.SearchVO;

public interface SearchService {

	public List<SearchVO> selectProgram() throws Exception;
	
	public int deleteReservaion(int num) throws Exception;
}
