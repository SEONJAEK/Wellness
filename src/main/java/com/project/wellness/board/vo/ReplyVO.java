package com.project.wellness.board.vo;

import java.util.Date;

public class ReplyVO {

	private int bno;	//글번호
	private int rno;	//댓글번호
	private String rContent;	//글내용
	private String userId;	//아이디
	private Date regDate;	//작성날짜
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [bno=" + bno + ", rno=" + rno + ", content=" + rContent + ", userid=" + userId + ", regdate="
				+ regDate + "]";
	}
	
	
	
	
}
