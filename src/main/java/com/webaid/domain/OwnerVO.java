package com.webaid.domain;

public class OwnerVO {
	private int ono;
	private String name;
	private String phone;
	private String mail;
	private String birth;
	private String id;
	private String pw;

	public OwnerVO() {
		super();
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
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
		return "OwnerVO [ono=" + ono + ", name=" + name + ", phone=" + phone + ", mail=" + mail + ", birth=" + birth
				+ ", id=" + id + ", pw=" + pw + "]";
	}

}
