package com.project.wellness.member.service;

import javax.inject.Inject;

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
	
}