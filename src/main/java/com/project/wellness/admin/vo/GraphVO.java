package com.project.wellness.admin.vo;


public class GraphVO {

	private int bno;//회원넘버링
	private String userId;
	private String userName;
	private String gender;
	private int age;
	private String phone;
	private String email;
	private String address;
	private int is_admin;
	
	private int count_male;
	private int count_female;
	
	public GraphVO() {}
	
	public GraphVO(int bno, String userId, String userName, String gender, int age, String phone, String email, String address, int is_admin,int count_male, int count_female) {
		this.bno = bno;
		this.userId = userId;
		this.userName = userName;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.email = email ;
		this.address = address;
		this.is_admin = is_admin ;
		this.count_male = count_male ;
		this.count_female = count_female ;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getIs_admin() {
		return is_admin;
	}

	public void setIs_admin(int is_admin) {
		this.is_admin = is_admin;
	}	
	public int getCount_male() {
		return count_male;
	}

	public void setCount_male(int count_male) {
		this.count_male = count_male;
	}

	public int getCount_female() {
		return count_female;
	}

	public void setCount_female(int count_female) {
		this.count_female = count_female;
	}
	
	
	
}