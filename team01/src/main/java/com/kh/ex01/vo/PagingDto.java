package com.kh.ex01.vo;

public class PagingDto {
	private int page = 1; // 현재 페이지
	private int startRow = 1; // 시작 rnum
	private int endRow = 10; // 끝 rnum
	private int startPage = 1; // 시작 페이지
	private int endPage = 10; // 끝페이지
	private int count; // 게시글 갯수
	private int totalPage; // 페이지 수
	private int perPage =10; 
	private String searchType ="t"; 
	private String keyword; 
	

	public PagingDto() {
		super();
	}

	public int getPage() {
		return page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	
	public void setPage(int page) {
		this.page = page;
		System.out.println("setPage 실행됨");
		// 1 : 1 ~ 10
		// 2 : 11 ~ 20
		// 3 : 21 ~ 30
		System.out.println("perPage: "+perPage);
		this.endRow = this.page * perPage;
		this.startRow = this.endRow - (perPage-1);
		// p : s ~ e
		// 1 : 1 ~ 10
		// 10 : 1 ~ 10
		// 11 : 11 ~ 20
		// 20 : 11 ~ 20
		this.startPage = (this.page - 1) / 10 * 10 + 1;
		this.endPage = this.startPage + (10-1);
		
		this.totalPage = (this.count / perPage) + ((this.count % perPage) > 0 ? 1 : 0); // 501개
		if (this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		this.totalPage = (this.count / 10) + ((this.count % 10) > 0 ? 1 : 0); // 501개:
		if (this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

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
		return "PagingDto [page=" + page + ", startRow=" + startRow + ", endRow=" + endRow + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", count=" + count + ", totalPage=" + totalPage + ", perPage=" + perPage
				+ ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	


	
}
