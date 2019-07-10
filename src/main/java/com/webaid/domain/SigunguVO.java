package com.webaid.domain;

public class SigunguVO {
	private int no;
	private int sido_no;
	private String sido_name;
	private String sigungu_name;

	public SigunguVO() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSido_no() {
		return sido_no;
	}

	public void setSido_no(int sido_no) {
		this.sido_no = sido_no;
	}

	public String getSido_name() {
		return sido_name;
	}

	public void setSido_name(String sido_name) {
		this.sido_name = sido_name;
	}

	public String getSigungu_name() {
		return sigungu_name;
	}

	public void setSigungu_name(String sigungu_name) {
		this.sigungu_name = sigungu_name;
	}

	@Override
	public String toString() {
		return "Sigungu [no=" + no + ", sido_no=" + sido_no + ", sido_name=" + sido_name + ", sigungu_name="
				+ sigungu_name + "]";
	}

}
