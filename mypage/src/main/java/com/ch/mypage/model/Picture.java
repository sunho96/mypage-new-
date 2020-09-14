package com.ch.mypage.model;

import lombok.Data;

@Data
public class Picture {
	private int pictureNum; // 사진 번호
	private String name; // 이름
	private int width; // 가로
	private int height; // 세로
	private int x; // x좌표
	private int y; // y좌표
	private int rotation; // 회전값
}
