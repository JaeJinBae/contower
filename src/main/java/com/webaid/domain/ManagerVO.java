package com.webaid.domain;

public class ManagerVO {
	private int mno;
	private String name;
	private String birth;
	private String phone;
	private String mail;
	private String company_name;
	private String company_num;
	private String company_ceo;
	private String id;
	private String pw;

	public ManagerVO() {
		super();
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_num() {
		return company_num;
	}

	public void setCompany_num(String company_num) {
		this.company_num = company_num;
	}

	public String getCompany_ceo() {
		return company_ceo;
	}

	public void setCompany_ceo(String company_ceo) {
		this.company_ceo = company_ceo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	@Override
	public String toString() {
		return "ManagerVO [mno=" + mno + ", name=" + name + ", birth=" + birth + ", phone=" + phone + ", mail=" + mail
				+ ", company_name=" + company_name + ", company_num=" + company_num + ", company_ceo=" + company_ceo
				+ ", id=" + id + ", pw=" + pw + "]";
	}

}
