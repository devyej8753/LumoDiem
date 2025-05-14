package com.lumodiem.common.vo;

public class Paging {
	// 전체 게시글 개수
	private int totalData;
	// 전체 페이지 개수
	private int totalPage;
	// 한 페이지당 게시글의 개수
	private int numPerPage = 5;
	// LIMIT 쿼리 앞쪽 숫자(몇개 스킵할건지)
	private int limitPageNo;
	// 현재 페이지 번호
	private int nowPage = 1;
	
	// 페이징바 관련 항목 처리 -> 1,2,3,4,5 나오다가 6,7,8,9,10 이런 식으로 보이게
	private int pageBarSize = 5;
	private int pageBarStart;
	private int pageBarEnd;
	
	private void calcPaging() {
		// 현재 페이지를 기준으로 건너뛸 데이터 개수
		// ex) 3페이지 -> 앞에 2페이지 -> 6개(한 페이지당 3개 가정) 
		limitPageNo = (nowPage - 1) * numPerPage;
		// 전체 게시글 개수 기준으로 페이지 개수 계산
		totalPage = (int)Math.ceil((double)totalData/numPerPage);
		
		// 페이징바
		// 시작 번호 -> 1/5... 4/5는 0으로 5/5가 1로 계산 되니까 1빼준다.
		pageBarStart = ((nowPage - 1) / pageBarSize)*pageBarSize + 1;
		// 끝 번호
		pageBarEnd = pageBarStart + pageBarSize - 1;
		if(pageBarEnd > totalPage) pageBarEnd = totalPage;
		// 이전, 이후 버튼
		if(pageBarStart == 1) prev = false;
		if(pageBarEnd >= totalPage) next = false;
	}
	
	// 이전, 다음 여부
	private boolean prev = true;
	private boolean next = true;
	public Paging() {
		super();
	}
	public Paging(int totalData, int totalPage, int numPerPage, int limitPageNo, int nowPage, int pageBarSize,
			int pageBarStart, int pageBarEnd, boolean prev, boolean next) {
		super();
		this.totalData = totalData;
		this.totalPage = totalPage;
		this.numPerPage = numPerPage;
		this.limitPageNo = limitPageNo;
		this.nowPage = nowPage;
		this.pageBarSize = pageBarSize;
		this.pageBarStart = pageBarStart;
		this.pageBarEnd = pageBarEnd;
		this.prev = prev;
		this.next = next;
	}
	public int getTotalData() {
		return totalData;
	}
	public void setTotalData(int totalData) {
		this.totalData = totalData;
		calcPaging();
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getLimitPageNo() {
		return limitPageNo;
	}
	public void setLimitPageNo(int limitPageNo) {
		this.limitPageNo = limitPageNo;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getPageBarSize() {
		return pageBarSize;
	}
	public void setPageBarSize(int pageBarSize) {
		this.pageBarSize = pageBarSize;
	}
	public int getPageBarStart() {
		return pageBarStart;
	}
	public void setPageBarStart(int pageBarStart) {
		this.pageBarStart = pageBarStart;
	}
	public int getPageBarEnd() {
		return pageBarEnd;
	}
	public void setPageBarEnd(int pageBarEnd) {
		this.pageBarEnd = pageBarEnd;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	
}
