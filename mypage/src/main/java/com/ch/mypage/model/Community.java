package com.ch.mypage.model;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;

@Data
public class Community {
	private int communityNum; // 커뮤니티 번호
	private Date shareDate; //  공유 날짜 
	private int likeyCount;
	private int diaryNum; // fk 다이어리 번호
	private Diary diary;
	
	private int rn; // 임시
	/* fk: 다이어리 번호 
	 * diaryNum number REFERENCES diary(diaryNum)
	 */
	
}
