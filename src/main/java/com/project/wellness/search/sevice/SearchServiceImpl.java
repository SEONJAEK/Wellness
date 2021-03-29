package com.project.wellness.search.sevice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.wellness.search.dao.SearchDao;
import com.project.wellness.search.vo.SearchVO;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	SearchDao searchDao;
	
	@Override
	public List<SearchVO> selectProgram() throws Exception {
		
		List<SearchVO> list = searchDao.selectSearch();
		return list;
	}
	
	@Override
	public int deleteReservaion(int num) throws Exception {
		
		int cnt = searchDao.deleteReservaion(num);
		return cnt;
	}

}
