package com.project.wellness.board.vo;

public class SearchCriteria extends Criteria{

	private String searchType = "";	//검색항목
	private String keyword = "";	//검색하는 문자열
	 
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}
