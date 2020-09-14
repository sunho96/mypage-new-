package com.ch.mypage.model;

import lombok.Data;

@Data
public class ObjectPosition {
	// 객체 위치
	private int objectPosNum; // 위치 번호
	private int width; // 가로크기
	private int height; // 세로 크기
	private int x; // x좌표
	private int y; // y좌표
	private int rotation; // 회전값
	private int diaryNum; // fk다이어리 번호
	private int stickerNum; // fk스티커 번호
	private int font; // fk폰트 번호
}
