package com.webaid.domain;

public class MonthlyRentRecordVO {
	private int no;
	private int bno;
	private int rno;
	private int record_year;
	private String january;
	private String february;
	private String march;
	private String april;
	private String may;
	private String june;
	private String july;
	private String august;
	private String september;
	private String october;
	private String november;
	private String december;

	public MonthlyRentRecordVO() {
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

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getRecord_year() {
		return record_year;
	}

	public void setRecord_year(int record_year) {
		this.record_year = record_year;
	}

	public String getJanuary() {
		return january;
	}

	public void setJanuary(String january) {
		this.january = january;
	}

	public String getFebruary() {
		return february;
	}

	public void setFebruary(String february) {
		this.february = february;
	}

	public String getMarch() {
		return march;
	}

	public void setMarch(String march) {
		this.march = march;
	}

	public String getApril() {
		return april;
	}

	public void setApril(String april) {
		this.april = april;
	}

	public String getMay() {
		return may;
	}

	public void setMay(String may) {
		this.may = may;
	}

	public String getJune() {
		return june;
	}

	public void setJune(String june) {
		this.june = june;
	}

	public String getJuly() {
		return july;
	}

	public void setJuly(String july) {
		this.july = july;
	}

	public String getAugust() {
		return august;
	}

	public void setAugust(String august) {
		this.august = august;
	}

	public String getSeptember() {
		return september;
	}

	public void setSeptember(String september) {
		this.september = september;
	}

	public String getOctober() {
		return october;
	}

	public void setOctober(String october) {
		this.october = october;
	}

	public String getNovember() {
		return november;
	}

	public void setNovember(String november) {
		this.november = november;
	}

	public String getDecember() {
		return december;
	}

	public void setDecember(String december) {
		this.december = december;
	}

	@Override
	public String toString() {
		return "MonthlyRentRecordVO [no=" + no + ", bno=" + bno + ", rno=" + rno + ", record_year=" + record_year
				+ ", january=" + january + ", february=" + february + ", march=" + march + ", april=" + april + ", may="
				+ may + ", june=" + june + ", july=" + july + ", august=" + august + ", september=" + september
				+ ", october=" + october + ", november=" + november + ", december=" + december + "]";
	}

}
