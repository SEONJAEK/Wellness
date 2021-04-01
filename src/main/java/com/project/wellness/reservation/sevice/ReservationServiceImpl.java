package com.project.wellness.reservation.sevice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.wellness.reservation.dao.ReservationDao;
import com.project.wellness.reservation.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	ReservationDao reservationDao;
	
	@Override
	public List<ReservationVO> selectReservation() throws Exception {
		
		List<ReservationVO> list = reservationDao.selectReservation();
		return list;
	}
	
	@Override
	public int deleteReservation(int num) throws Exception {
		
		int cnt = reservationDao.deleteReservation(num);
		return cnt;
	}
	
//	@Override
//	public int insertReservation() throws Exception {
//		
//		int cnt = searchDao.insertReservation();
//		return cnt;
//	}

}
