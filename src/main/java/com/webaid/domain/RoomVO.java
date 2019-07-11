package com.webaid.domain;

public class RoomVO implements Comparable<RoomVO> {
	private int no;
	private int bno;
	private String bname;
	private int rno;
	private String state;
	private String room_type;
	private String pay_type;
	private String tenant;
	private String phone;
	private String check_in;
	private String check_out;
	private int deposit;
	private int monthly_rent;
	private String hope_price;
	private String selling_type;
	private String repair;
	private String company;
	private String company_call;
	private int downpayment;
	private String memo;

	public RoomVO() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getRno() {
		return rno;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getPay_type() {
		return pay_type;
	}

	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	public String getTenant() {
		return tenant;
	}

	public void setTenant(String tenant) {
		this.tenant = tenant;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCheck_in() {
		return check_in;
	}

	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}

	public String getCheck_out() {
		return check_out;
	}

	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public int getMonthly_rent() {
		return monthly_rent;
	}

	public void setMonthly_rent(int monthly_rent) {
		this.monthly_rent = monthly_rent;
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

	public String getRepair() {
		return repair;
	}

	public void setRepair(String repair) {
		this.repair = repair;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCompany_call() {
		return company_call;
	}

	public void setCompany_call(String company_call) {
		this.company_call = company_call;
	}

	public int getDownpayment() {
		return downpayment;
	}

	public void setDownpayment(int downpayment) {
		this.downpayment = downpayment;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "RoomVO [no=" + no + ", bno=" + bno + ", bname=" + bname + ", rno=" + rno + ", state=" + state
				+ ", room_type=" + room_type + ", pay_type=" + pay_type + ", tenant=" + tenant + ", phone=" + phone
				+ ", check_in=" + check_in + ", check_out=" + check_out + ", deposit=" + deposit + ", monthly_rent="
				+ monthly_rent + ", hope_price=" + hope_price + ", selling_type=" + selling_type + ", repair=" + repair
				+ ", company=" + company + ", company_call=" + company_call + ", downpayment=" + downpayment + ", memo="
				+ memo + "]";
	}

	@Override
	public int compareTo(RoomVO o) {
		return check_in.compareTo(o.getCheck_in());
	}

}
