package com.ch.mypage.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Diary {

	private int diaryNum; // �떎�씠�뼱由� 踰덊샇
	private String subject; // �젣紐�
	private Date regDate; // �궇吏�
	private Date updateDate; // �닔�젙�뿬遺�
	private String del; // �궘�젣 �뿬遺�
	private int diaryCataNum; // fk 移댄뀒怨좊━ 踰덊샇
	private int memberNum; // fk �쉶�썝 踰덊샇
	//insertForm catagoryname
	private String name;

}
