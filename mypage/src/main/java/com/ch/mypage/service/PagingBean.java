package com.ch.mypage.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagingBean {
	private int currentPage;
	private int rowPerPage;
	private int total;
	private int pagePerBlock = 5;
	private int totalPage;
	private int endPage;
	private int startPage;

	
public PagingBean(int currentPage, int rowPerPage, int total) {
	this.currentPage = currentPage;
	this.rowPerPage = rowPerPage;
	this.total = total;
	// double은 소숫점 이하를 보존
	// Math.ceil는 소숫점 이하에 숫자가 있으면 1증가
	totalPage = (int) Math.ceil((double) total / rowPerPage);
	startPage = currentPage - (currentPage - 1) % pagePerBlock;
	endPage = startPage + pagePerBlock - 1;
	if (endPage > totalPage)
		endPage = totalPage;
}
}
