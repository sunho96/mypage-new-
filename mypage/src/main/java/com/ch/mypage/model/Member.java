package com.ch.mypage.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {

	private int memberNum; // 멤버 번호
	private String email; // 이메일
	private String password; // 비밀번호
	private String name; // 이름
	private String nickName; // 별명
	private String tel; // 전화번호
	private Date regDate; // 가입날짜
	private String del; // 삭제여부

}
