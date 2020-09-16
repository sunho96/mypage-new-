package com.ch.mypage.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Diary {

	private int diaryNum; 
	private String subject; //
	private Date regDate; //
	private Date updateDate; // 
	private String del; // 
	private int diaryCataNum; //
	private int memberNum; // 
	//insertForm catagoryname
	private String name;

}
