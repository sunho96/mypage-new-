package com.ch.mypage.dao;

import java.util.List;

import com.ch.mypage.model.DiaryCatagory;
import com.ch.mypage.model.MemAndCata;

public interface DiaryCataDao {
	
	int insertCata(String name);

	List<MemAndCata> cataList(int memberNum);

	int cataDel(int diaryCataNum, int memberNum);

	int insertMemAndCata(int memberNum, int diaryCataNum);

	int memAnaCataDel(int memberNum, int diaryCataNum);

	DiaryCatagory selectCata(String name);

	MemAndCata selectMemAndCata(int diaryCataNum, int memberNum);

	int memAndCataAllDel(int memberNum);

	int updateMemAndCata(int memberNum, int diaryCataNum);

	int selectGitaNum(String name);
}
