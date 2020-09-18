package com.ch.mypage.model;

import lombok.Data;

@Data
public class ObjectPosition {
	// 객체 위치
	private int objectPosNum; // 위치 번호
	private Object width; // 가로크기
	private Object height; // 세로 크기
	private Object x; // x좌표
	private Object y; // y좌표
	private int rotation; // 회전값
	private int diaryNum; // fk다이어리 번호
	private int stickerNum; // fk스티커 번호
	private int pictureNum;//사진 번호
	private int textboxNum;
}
