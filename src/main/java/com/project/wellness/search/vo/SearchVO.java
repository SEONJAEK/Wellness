package com.project.wellness.search.vo;

import java.sql.Date;

public class SearchVO {

	private int num;
	private Date regDate;
	private String programName;
	private String programTime;
	private String userId;
	private String userName;
	
	public SearchVO() {}
	
	public SearchVO(int num, Date regDate, String programName, String programTime, String userId, String userName) {
		this.num = num;
		this.regDate = regDate;
		this.programName = programName;
		this.programTime = programTime;
		this.userId = userId;
		this.userName = userName;
	}	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getProgramName() {
		return programName;
	}
	public void setProgramName(String programName) {
		this.programName = programName;
	}
	public String getProgramTime() {
		return programTime;
	}
	public void setProgramTime(String programTime) {
		this.programTime = programTime;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
