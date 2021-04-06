package com.project.wellness.reservation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.wellness.reservation.vo.ReservationVO;

@Repository
public class ReservationDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ReservationDao() {
	}

	public List<ReservationVO> selectReservation(ReservationVO vo) throws Exception {

		List<ReservationVO> list = sqlSession.selectList("Reservation.selectReservation", vo);
		return list;
	}

	public int deleteReservation(int num) throws Exception {

		int cnt = sqlSession.delete("Reservation.deleteReservation", num);
		return cnt;
	}

	public int insertReservation(ReservationVO vo) throws Exception {
		int cnt = 0;
		try {
			cnt = sqlSession.insert("Reservation.insertReservation", vo);
			
        } catch (Exception e) {
        	String error_message = e.getMessage();
        	boolean check_error = error_message.contains("ALREADY REGISTERED");
        	if(check_error ==true) {
        		return -1;
        	}else {
        		return -2;
        	}
        }
		return cnt;
		

	}

	// 관리자페이지_회원 yoga1 select
	public List<ReservationVO> selectReservationYoga1(String date) throws Exception {

		List<ReservationVO> list = sqlSession.selectList("Reservation.selectReservationYoga1", date);
		return list;
	}

	// 관리자페이지_회원 yoga2 select
	public List<ReservationVO> selectReservationYoga2(String date) throws Exception {

		List<ReservationVO> list = sqlSession.selectList("Reservation.selectReservationYoga2", date);
		return list;
	}

	// 관리자페이지_회원 pilates1 select
	public List<ReservationVO> selectReservationPilates1(String date) throws Exception {

		List<ReservationVO> list = sqlSession.selectList("Reservation.selectReservationPilates1", date);
		return list;
	}

	// 관리자페이지_회원 pilates2 select
	public List<ReservationVO> selectReservationPilates2(String date) throws Exception {

		List<ReservationVO> list = sqlSession.selectList("Reservation.selectReservationPilates2", date);
		return list;
	}

	// 관리자페이지_회원 aerobic1 select
	public List<ReservationVO> selectReservationAerobic1(String date) throws Exception {

		List<ReservationVO> list = sqlSession.selectList("Reservation.selectReservationAerobic1", date);
		return list;
	}

	// 관리자페이지_회원 erobic2 select
	public List<ReservationVO> selectReservationAerobic2(String date) throws Exception {

		List<ReservationVO> list = sqlSession.selectList("Reservation.selectReservationAerobic2", date);
		return list;
	}

}
