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

	// 날짜별 회원 yoga1 예약 현황
	@Override
	public List<ReservationVO> selectReservationYoga1(String date) throws Exception {

		List<ReservationVO> list = reservationDao.selectReservationYoga1(date);
		return list;
	}

	// 날짜별 회원 yoga2 예약 현황
	@Override
	public List<ReservationVO> selectReservationYoga2(String date) throws Exception {

		List<ReservationVO> list = reservationDao.selectReservationYoga2(date);
		return list;
	}

	// 날짜별 회원 pilates1 예약 현황
	@Override
	public List<ReservationVO> selectReservationPilates1(String date) throws Exception {

		List<ReservationVO> list = reservationDao.selectReservationPilates1(date);
		return list;
	}

	// 날짜별 회원 pilates2 예약 현황
	@Override
	public List<ReservationVO> selectReservationPilates2(String date) throws Exception {

		List<ReservationVO> list = reservationDao.selectReservationPilates2(date);
		return list;
	}

	// 날짜별 회원 aerobic1 예약 현황
	@Override
	public List<ReservationVO> selectReservationAerobic1(String date) throws Exception {

		List<ReservationVO> list = reservationDao.selectReservationAerobic1(date);
		return list;
	}

	// 날짜별 회원 aerobic2 예약 현황
	@Override
	public List<ReservationVO> selectReservationAerobic2(String date) throws Exception {

		List<ReservationVO> list = reservationDao.selectReservationAerobic2(date);
		return list;
	}

}
