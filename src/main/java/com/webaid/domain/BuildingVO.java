package com.webaid.domain;

public class BuildingVO {
	private int bno;
	private String bname;
	private String baddr_old;
	private String baddr_new;
	private String bpw;
	private String heating;
	private String boption;
	private String completion_date;
	private int site;
	private int gross_area;
	private String road;
	private int ono;
	private String oname;
	private String ophone;
	private String obirth;
	private int mno;
	private String mphone;
	private int cnt_one;
	private int cnt_mitwo;
	private int cnt_two;
	private int cnt_three;
	private int cnt_owner;
	private int cnt_store;
	private int cnt_complete;
	private int cnt_contract_complete;
	private int cnt_empty;
	private int total_monthly_rent;
	private int total_deposit;
	private String memo;

	public BuildingVO() {
		super();
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

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOphone() {
		return ophone;
	}

	public void setOphone(String ophone) {
		this.ophone = ophone;
	}

	public String getObirth() {
		return obirth;
	}

	public void setObirth(String obirth) {
		this.obirth = obirth;
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

	public int getCnt_complete() {
		return cnt_complete;
	}

	public void setCnt_complete(int cnt_complete) {
		this.cnt_complete = cnt_complete;
	}

	public int getCnt_contract_complete() {
		return cnt_contract_complete;
	}

	public void setCnt_contract_complete(int cnt_contract_complete) {
		this.cnt_contract_complete = cnt_contract_complete;
	}

	public int getCnt_empty() {
		return cnt_empty;
	}

	public void setCnt_empty(int cnt_empty) {
		this.cnt_empty = cnt_empty;
	}

	public int getTotal_monthly_rent() {
		return total_monthly_rent;
	}

	public void setTotal_monthly_rent(int total_monthly_rent) {
		this.total_monthly_rent = total_monthly_rent;
	}

	public int getTotal_deposit() {
		return total_deposit;
	}

	public void setTotal_deposit(int total_deposit) {
		this.total_deposit = total_deposit;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "BuildingVO [bno=" + bno + ", bname=" + bname + ", baddr_old=" + baddr_old + ", baddr_new=" + baddr_new
				+ ", bpw=" + bpw + ", heating=" + heating + ", boption=" + boption + ", completion_date="
				+ completion_date + ", site=" + site + ", gross_area=" + gross_area + ", road=" + road + ", ono=" + ono
				+ ", oname=" + oname + ", ophone=" + ophone + ", obirth=" + obirth + ", mno=" + mno + ", mphone="
				+ mphone + ", cnt_one=" + cnt_one + ", cnt_mitwo=" + cnt_mitwo + ", cnt_two=" + cnt_two + ", cnt_three="
				+ cnt_three + ", cnt_owner=" + cnt_owner + ", cnt_store=" + cnt_store + ", cnt_complete=" + cnt_complete
				+ ", cnt_contract_complete=" + cnt_contract_complete + ", cnt_empty=" + cnt_empty
				+ ", total_monthly_rent=" + total_monthly_rent + ", total_deposit=" + total_deposit + ", memo=" + memo
				+ "]";
	}

}
