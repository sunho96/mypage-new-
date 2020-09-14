package com.ch.mypage.model;

import lombok.Data;

@Data
public class DiaryCatagory {
	// 다이어리 카테고리
	private int diaryCataNum; // 카테고리 번호
	private String name; // 이름
	private String del; //삭제 여부

}
