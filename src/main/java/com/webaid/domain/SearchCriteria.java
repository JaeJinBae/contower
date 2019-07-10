package com.webaid.domain;

public class SearchCriteria extends Criteria {
	private String searchType;
	private String keyword1;
	private String keyword2;
	

	public SearchCriteria() {
		super();
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword1() {
		return keyword1;
	}

	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}

	public String getKeyword2() {
		return keyword2;
	}

	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}

	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword1=" + keyword1 + ", keyword2=" + keyword2 + "]";
	}

	

}
