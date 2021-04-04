package com.project.wellness.reservation.sevice;

import java.util.List;

import com.project.wellness.reservation.vo.ReservationVO;

public interface ReservationService {

	public List<ReservationVO> selectReservation(ReservationVO vo) throws Exception;
	
	public int deleteReservation(int num) throws Exception;
	
	public int insertReservation(ReservationVO vo) throws Exception;
	
	//선재 회원 예약 코드 날짜 
		public List<ReservationVO> selectReservationByDate(String date) throws Exception;
}
