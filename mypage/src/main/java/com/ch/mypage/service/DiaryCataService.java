package com.ch.mypage.service;

import java.util.List;

import com.ch.mypage.model.DiaryCatagory;
import com.ch.mypage.model.MemAndCata;

public interface DiaryCataService {
	
	List<MemAndCata> cataList(int memberNum);

	int insertCata(String name);

	int cataDel(int diaryCataNum, int memberNum);

	int insertMemAndCata(int memberNum, int diaryCataNum);

	int memAnaCataDel(int memberNum, int diaryCataNum);

	DiaryCatagory selectCata(String name);

	MemAndCata selectMemAndCata(int diaryCataNum, int memberNum);

	int memAndCataAllDel(int memberNum);

}
