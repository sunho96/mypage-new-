package com.ch.mypage.model;

import java.sql.Date;

import lombok.Data;

@Data
public class AccountBook {
	private int abookNum;
	private String dealType;
	private int amount;
	private String accounts;
	private String category;
	private Date regDate;
	private String memo;
	private int accountNum;

}
