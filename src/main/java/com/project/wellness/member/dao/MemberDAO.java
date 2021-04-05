package com.project.wellness.member.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.wellness.member.vo.MemberVO;

@Repository
public class MemberDAO {

	@Inject SqlSession sql;
	
	// 회원가입
	public int join(MemberVO vo) throws Exception {
		int cnt = sql.insert("Member.join", vo);
		return cnt;
		
	}
	
	//로그인
	public boolean login(MemberVO memberVO) throws Exception {
		String login = sql.selectOne("Member.login", memberVO);
		return (login == null) ? false: true;
		
	}
	
	
	public MemberVO viewMember(MemberVO memberVO) {
		return sql.selectOne("Member.viewMember", memberVO);
	}
	
	//회원정보 수정
	public void joinupd(MemberVO memberVO) {
		sql.update("Member.joinupd", memberVO);
	}
	
	//아이디찾기
	public MemberVO idfind(MemberVO memberVO) {
		return sql.selectOne("Member.idfind", memberVO);
	}

	

}
