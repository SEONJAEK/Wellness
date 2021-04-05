package com.project.wellness.reservation.sevice;

import java.util.List;

import com.project.wellness.reservation.vo.ReservationVO;

public interface ReservationService {

	public List<ReservationVO> selectReservation(ReservationVO vo) throws Exception;
	
	public int deleteReservation(int num) throws Exception;
	
	public int insertReservation(ReservationVO vo) throws Exception;
	
	//날짜별 회원 yoga1 예약 현황
	public List<ReservationVO> selectReservationYoga1(String date) throws Exception;
	//날짜별 회원 yoga2 예약 현황
	public List<ReservationVO> selectReservationYoga2(String date) throws Exception;
	//날짜별 회원 pilates1 예약 현황
	public List<ReservationVO> selectReservationPilates1(String date) throws Exception;
	//날짜별 회원pilates2 예약 현황
	public List<ReservationVO> selectReservationPilates2(String date) throws Exception;
	//날짜별 회원 aerobic1 예약 현황
	public List<ReservationVO> selectReservationAerobic1(String date) throws Exception;
	//날짜별 회원 aerobic2 예약 현황
	public List<ReservationVO> selectReservationAerobic2(String date) throws Exception;
}
