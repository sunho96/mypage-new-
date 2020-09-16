package com.ch.mypage.model;

import java.sql.Date;
import java.util.Collection;

import lombok.Data;
import lombok.Getter;

@Data
public class Community {
	private int communityNum; // 커뮤니티 번호
	private Date shareDate; //  공유 날짜 
	private int likeyCount;
	private int diaryNum; // fk 다이어리 번호
	private int rn;
	
	//조인용
	private String nickName;
	private Diary diary;
	private Collection<CommunityComments> commentsList;
	private int likeyCnt;
	/* fk: 다이어리 번호 
	 * diaryNum number REFERENCES diary(diaryNum)
	 */
	
}
