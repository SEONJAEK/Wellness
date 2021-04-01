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
	
	private int m_ten;
	private int m_twenty;
	private int m_thirty;
	private int m_fourty;
	private int m_fifty;
	private int m_other;
	
	private int f_ten;
	private int f_twenty;
	private int f_thirty;
	private int f_fourty;
	private int f_fifty;
	private int f_other;
	
	
	

	public int getM_ten() {
		return m_ten;
	}

	public void setM_ten(int m_ten) {
		this.m_ten = m_ten;
	}

	public int getM_twenty() {
		return m_twenty;
	}

	public void setM_twenty(int m_twenty) {
		this.m_twenty = m_twenty;
	}

	public int getM_thirty() {
		return m_thirty;
	}

	public void setM_thirty(int m_thirty) {
		this.m_thirty = m_thirty;
	}

	public int getM_fourty() {
		return m_fourty;
	}

	public void setM_fourty(int m_fourty) {
		this.m_fourty = m_fourty;
	}

	public int getM_fifty() {
		return m_fifty;
	}

	public void setM_fifty(int m_fifty) {
		this.m_fifty = m_fifty;
	}

	public int getM_other() {
		return m_other;
	}

	public void setM_other(int m_other) {
		this.m_other = m_other;
	}

	public int getF_ten() {
		return f_ten;
	}

	public void setF_ten(int f_ten) {
		this.f_ten = f_ten;
	}

	public int getF_twenty() {
		return f_twenty;
	}

	public void setF_twenty(int f_twenty) {
		this.f_twenty = f_twenty;
	}

	public int getF_thirty() {
		return f_thirty;
	}

	public void setF_thirty(int f_thirty) {
		this.f_thirty = f_thirty;
	}

	public int getF_fourty() {
		return f_fourty;
	}

	public void setF_fourty(int f_fourty) {
		this.f_fourty = f_fourty;
	}

	public int getF_fifty() {
		return f_fifty;
	}

	public void setF_fifty(int f_fifty) {
		this.f_fifty = f_fifty;
	}

	public int getF_other() {
		return f_other;
	}

	public void setF_other(int f_other) {
		this.f_other = f_other;
	}

	public GraphVO() {}
	
	public GraphVO(int bno, String userId, String userName, String gender, int age, String phone, String email, 
			String address, int is_admin,int count_male, int count_female, int m_ten, int m_twenty, int m_thirty,int m_fourty,
			int m_fifty,int m_other,int f_ten, int f_twenty,int f_thirty,int f_fourty,int f_fifty,int f_other) {
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
		
		this.m_ten = m_ten;
		this.m_twenty = m_twenty;
		this.m_thirty = m_thirty;
		this.m_fourty = m_fourty;
		this.m_fifty = m_fifty;
		this.m_other = m_other;
		
		this.f_ten = f_ten;
		this.f_twenty = f_twenty;
		this.f_thirty = f_thirty;
		this.f_fourty = f_fourty;
		this.f_fifty = f_fifty;
		this.f_other = f_other;
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