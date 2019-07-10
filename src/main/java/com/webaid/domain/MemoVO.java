package com.webaid.domain;

public class MemoVO {
	private int no;
	private int mno;
	private String mdate;
	private String content;

	public MemoVO() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "MemoVO [no=" + no + ", mno=" + mno + ", mdate=" + mdate + ", content=" + content + "]";
	}

}
