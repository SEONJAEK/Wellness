package com.project.wellness.member.service;

import javax.servlet.http.HttpSession;

import com.project.wellness.member.vo.MemberVO;

public interface MemberService {
	
	public int join(MemberVO vo) throws Exception;
	
	public boolean login(MemberVO vo, HttpSession session) throws Exception;
	
	public MemberVO viewMember(MemberVO vo);
}
