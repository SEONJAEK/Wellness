package com.project.wellness.member.service;

import java.lang.reflect.Member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.project.wellness.member.dao.MemberDAO;
import com.project.wellness.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject MemberDAO dao;
	
	@Override
	public int join(MemberVO vo) throws Exception {
		int cnt = dao.join(vo);
		return cnt;
		
	}
	
	@Override
	public boolean login(MemberVO vo, HttpSession session) throws Exception {
		boolean result = dao.login(vo);
		if(result) {
			MemberVO vo2 = viewMember(vo);
			session.setAttribute("userId", vo2.getUserId());
			session.setAttribute("userName", vo2.getUserName());
			session.setAttribute("isAdmin", vo2.getIsAdmin());
		}
		
		return result;
	}
	
	@Override
	public MemberVO viewMember(MemberVO vo) {
		return dao.viewMember(vo);
	}
	@Override
	public void joinupd(MemberVO memberVO) {
		dao.joinupd(memberVO);
	}
	
	@Override
	public MemberVO idfind(MemberVO memberVO) {
		return dao.idfind(memberVO);
	}
}