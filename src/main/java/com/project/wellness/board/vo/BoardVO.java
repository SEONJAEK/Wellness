package com.project.wellness.board.vo;

import java.util.Date;

public class BoardVO {

	private int bno;  //글번호(프라이머리키)
	private String title; //글제목
	private String content; //글내용
	private String userId; //아이디
	private Date bRegDate; //작성날짜
	private int hit; //조회수
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getbRegDate() {
		return bRegDate;
	}
	public void setbRegDate(Date bRegDate) {
		this.bRegDate = bRegDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	
}
