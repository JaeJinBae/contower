package com.webaid.domain;

public class RepairCompanyVO {
	private int no;
	private String name;
	private String addr;
	private String callnum;
	private String repairtype;
	private String business_area;
	private String content;

	public RepairCompanyVO() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getCallnum() {
		return callnum;
	}

	public void setCallnum(String callnum) {
		this.callnum = callnum;
	}

	public String getRepairtype() {
		return repairtype;
	}

	public void setRepairtype(String repairtype) {
		this.repairtype = repairtype;
	}

	public String getBusiness_area() {
		return business_area;
	}

	public void setBusiness_area(String business_area) {
		this.business_area = business_area;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "RepairCompanyVO [no=" + no + ", name=" + name + ", addr=" + addr + ", callnum=" + callnum
				+ ", repairtype=" + repairtype + ", business_area=" + business_area + ", content=" + content + "]";
	}

}
