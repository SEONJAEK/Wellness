package com.project.wellness.reservation.sevice;

import java.util.List;

import com.project.wellness.reservation.vo.ReservationVO;

public interface ReservationService {

	public List<ReservationVO> selectReservation() throws Exception;
	
	public int deleteReservation(int num) throws Exception;
	
//	public int insertReservation() throws Exception;
}
