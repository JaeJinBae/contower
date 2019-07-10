package com.webaid.domain;

public class EmptyroomVO {
	private int no;
	private int rno;
	private String room_type;
	private String rpw;
	private String hope_price;
	private String selling_type;
	private int bno;
	private String bname;
	private String baddr_old;
	private String baddr_new;
	private String bpw;
	private String heating;
	private String boption;
	private String completion_date;
	private int mno;
	private String mphone;

	public EmptyroomVO() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getRpw() {
		return rpw;
	}

	public void setRpw(String rpw) {
		this.rpw = rpw;
	}

	public String getHope_price() {
		return hope_price;
	}

	public void setHope_price(String hope_price) {
		this.hope_price = hope_price;
	}

	public String getSelling_type() {
		return selling_type;
	}

	public void setSelling_type(String selling_type) {
		this.selling_type = selling_type;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getBaddr_old() {
		return baddr_old;
	}

	public void setBaddr_old(String baddr_old) {
		this.baddr_old = baddr_old;
	}

	public String getBaddr_new() {
		return baddr_new;
	}

	public void setBaddr_new(String baddr_new) {
		this.baddr_new = baddr_new;
	}

	public String getBpw() {
		return bpw;
	}

	public void setBpw(String bpw) {
		this.bpw = bpw;
	}

	public String getHeating() {
		return heating;
	}

	public void setHeating(String heating) {
		this.heating = heating;
	}

	public String getBoption() {
		return boption;
	}

	public void setBoption(String boption) {
		this.boption = boption;
	}

	public String getCompletion_date() {
		return completion_date;
	}

	public void setCompletion_date(String completion_date) {
		this.completion_date = completion_date;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	@Override
	public String toString() {
		return "EmptyroomVO [no=" + no + ", rno=" + rno + ", room_type=" + room_type + ", rpw=" + rpw + ", hope_price="
				+ hope_price + ", selling_type=" + selling_type + ", bno=" + bno + ", bname=" + bname + ", baddr_old="
				+ baddr_old + ", baddr_new=" + baddr_new + ", bpw=" + bpw + ", heating=" + heating + ", boption="
				+ boption + ", completion_date=" + completion_date + ", mno=" + mno + ", mphone=" + mphone + "]";
	}

}
