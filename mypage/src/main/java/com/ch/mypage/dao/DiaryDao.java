package com.ch.mypage.dao;

import java.util.List;
import com.ch.mypage.model.Diary;


public interface DiaryDao {

	int insert(Diary diary);

	List<Diary> list(int memberNum);

	Diary select(int diaryNum);

	int update(Diary diary);

	int delete(int diaryNum);

	int save(int diaryNum);

	int del(int diaryNum);

	List<Diary> typeList(int memberNum, int diaryCataNum);

	int selectDiaryNum();

	int insertSelect(Diary diary);

	int allDel(int memberNum);

	List<Integer> memberSelect(int memberNum);

	int updateCataGita(int diaryCataNum, int gitaNum);
}
