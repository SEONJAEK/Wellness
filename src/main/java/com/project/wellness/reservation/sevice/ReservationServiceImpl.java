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
	public List<ReservationVO> selectReservation(ReservationVO vo) throws Exception {
		
		List<ReservationVO> list = reservationDao.selectReservation(vo);
		return list;
	}
	
	@Override
	public int deleteReservation(int num) throws Exception {
		
		int cnt = reservationDao.deleteReservation(num);
		return cnt;
	}
	
	@Override
	public int insertReservation(ReservationVO vo) throws Exception {
		
		int cnt = reservationDao.insertReservation(vo);
		return cnt;
	}
	
	//선재 회원 예약 코드 날짜 
		@Override
		public List<ReservationVO> selectReservationByDate(String date) throws Exception {
			
			List<ReservationVO> list = reservationDao.selectReservationByDate(date);
			return list;
		}

}
