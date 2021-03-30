package com.project.wellness.member.vo;

import java.util.Date;

public class MemberVO {
	
	private String userId;
	private String userPass;
	private String userName;
	private String address;
	private String post_num;
	private String address2;
	private String gender;
	private String phone;
	private String email;
	private String userBirth1;
	private String userBirth2;
	private String userBirth3;
	private int isAdmin;
	private int isCoach;
	private Date joinDate;
	
	public MemberVO () {
		
	}
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", address="
				+ address + ", post_num=" + post_num + ", address2=" + address2 + ", gender=" + gender + ", phone="
				+ phone + ", email=" + email + ", userBirth1=" + userBirth1 + ", userBirth2=" + userBirth2
				+ ", userBirth3=" + userBirth3 + ", isAdmin=" + isAdmin + ", isCoach=" + isCoach + ", joinDate="
				+ joinDate + "]";
	}
	public MemberVO(String userId, String userPass, String userName, String address, String post_num, String address2,
			String gender, String phone, String email, String userBirth1, String userBirth2, String userBirth3,
			int isAdmin, int isCoach, Date joinDate) {
		super();
		this.userId = userId;
		this.userPass = userPass;
		this.userName = userName;
		this.address = address;
		this.post_num = post_num;
		this.address2 = address2;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.userBirth1 = userBirth1;
		this.userBirth2 = userBirth2;
		this.userBirth3 = userBirth3;
		this.isAdmin = isAdmin;
		this.isCoach = isCoach;
		this.joinDate = joinDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPost_num() {
		return post_num;
	}
	public void setPost_num(String post_num) {
		this.post_num = post_num;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserBirth1() {
		return userBirth1;
	}
	public void setUserBirth1(String userBirth1) {
		this.userBirth1 = userBirth1;
	}
	public String getUserBirth2() {
		return userBirth2;
	}
	public void setUserBirth2(String userBirth2) {
		this.userBirth2 = userBirth2;
	}
	public String getUserBirth3() {
		return userBirth3;
	}
	public void setUserBirth3(String userBirth3) {
		this.userBirth3 = userBirth3;
	}
	public int getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	public int getIsCoach() {
		return isCoach;
	}
	public void setIsCoach(int isCoach) {
		this.isCoach = isCoach;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
}
