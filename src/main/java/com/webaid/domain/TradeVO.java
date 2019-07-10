package com.webaid.domain;

public class TradeVO {
	private int no;
	private int bno;
	private String baddr;
	private String completion_date;
	private int site;
	private int gross_area;
	private String road;
	private String heating;
	private int cnt_one;
	private int cnt_mitwo;
	private int cnt_two;
	private int cnt_three;
	private int cnt_owner;
	private int cnt_store;
	private int trade_price;
	private int total_deposit;
	private int total_monthly_rent;
	private int financing;
	private String interest_percent;

	public TradeVO() {
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

	public String getBaddr() {
		return baddr;
	}

	public void setBaddr(String baddr) {
		this.baddr = baddr;
	}

	public String getCompletion_date() {
		return completion_date;
	}

	public void setCompletion_date(String completion_date) {
		this.completion_date = completion_date;
	}

	public int getSite() {
		return site;
	}

	public void setSite(int site) {
		this.site = site;
	}

	public int getGross_area() {
		return gross_area;
	}

	public void setGross_area(int gross_area) {
		this.gross_area = gross_area;
	}

	public String getRoad() {
		return road;
	}

	public void setRoad(String road) {
		this.road = road;
	}

	public String getHeating() {
		return heating;
	}

	public void setHeating(String heating) {
		this.heating = heating;
	}

	public int getCnt_one() {
		return cnt_one;
	}

	public void setCnt_one(int cnt_one) {
		this.cnt_one = cnt_one;
	}

	public int getCnt_mitwo() {
		return cnt_mitwo;
	}

	public void setCnt_mitwo(int cnt_mitwo) {
		this.cnt_mitwo = cnt_mitwo;
	}

	public int getCnt_two() {
		return cnt_two;
	}

	public void setCnt_two(int cnt_two) {
		this.cnt_two = cnt_two;
	}

	public int getCnt_three() {
		return cnt_three;
	}

	public void setCnt_three(int cnt_three) {
		this.cnt_three = cnt_three;
	}

	public int getCnt_owner() {
		return cnt_owner;
	}

	public void setCnt_owner(int cnt_owner) {
		this.cnt_owner = cnt_owner;
	}

	public int getCnt_store() {
		return cnt_store;
	}

	public void setCnt_store(int cnt_store) {
		this.cnt_store = cnt_store;
	}

	public int getTrade_price() {
		return trade_price;
	}

	public void setTrade_price(int trade_price) {
		this.trade_price = trade_price;
	}

	public int getTotal_deposit() {
		return total_deposit;
	}

	public void setTotal_deposit(int total_deposit) {
		this.total_deposit = total_deposit;
	}

	public int getTotal_monthly_rent() {
		return total_monthly_rent;
	}

	public void setTotal_monthly_rent(int total_monthly_rent) {
		this.total_monthly_rent = total_monthly_rent;
	}

	public int getFinancing() {
		return financing;
	}

	public void setFinancing(int financing) {
		this.financing = financing;
	}

	public String getInterest_percent() {
		return interest_percent;
	}

	public void setInterest_percent(String interest_percent) {
		this.interest_percent = interest_percent;
	}

	@Override
	public String toString() {
		return "TradeVO [no=" + no + ", bno=" + bno + ", baddr=" + baddr + ", completion_date=" + completion_date
				+ ", site=" + site + ", gross_area=" + gross_area + ", road=" + road + ", heating=" + heating
				+ ", cnt_one=" + cnt_one + ", cnt_mitwo=" + cnt_mitwo + ", cnt_two=" + cnt_two + ", cnt_three="
				+ cnt_three + ", cnt_owner=" + cnt_owner + ", cnt_store=" + cnt_store + ", trade_price=" + trade_price
				+ ", total_deposit=" + total_deposit + ", total_monthly_rent=" + total_monthly_rent + ", financing="
				+ financing + ", interest_percent=" + interest_percent + "]";
	}

}
