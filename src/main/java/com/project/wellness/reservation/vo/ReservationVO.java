package com.project.wellness.reservation.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReservationVO {

	private int num;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	private String programName;
	private String programTime;
	private String userId;
	private String userName;
	private String programId;
	private String phone;
	
	public ReservationVO() {}
	
	public ReservationVO(int num, Date regDate, String programName, String programTime, String userId, String userName, String programId, String phone) {
		this.num = num;
		this.regDate = regDate;
		this.programName = programName;
		this.programTime = programTime;
		this.userId = userId;
		this.userName = userName;
		this.programId = programId;
		this.phone = phone;
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
	public String getProgramId() {
		return programId;
	}
	public void setProgramId(String programId) {
		this.programId = programId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
