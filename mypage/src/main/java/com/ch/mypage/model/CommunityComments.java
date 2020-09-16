package com.ch.mypage.model;

import java.sql.Date;

import lombok.Data;

@Data
public class CommunityComments {
	private int commentsNum;
	private String content;
	private int ref;
	private int re_step;
	private Date regDate;
	private int memberNum;
	private int communityNum;
	
	//member하고 조인용
	private String nickName;

	
}
