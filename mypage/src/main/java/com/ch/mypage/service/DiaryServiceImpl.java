package com.ch.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.mypage.dao.DiaryDao;
import com.ch.mypage.model.Diary;

@Service
public class DiaryServiceImpl implements DiaryService {
	@Autowired
	private DiaryDao dd;

	@Override
	public int insert(Diary diary) {
		
		return dd.insert(diary);
	}

	@Override
	public List<Diary> list(int memberNum) {
		
		return dd.list(memberNum);
	}

	@Override
	public Diary select(int diaryNum) {
		
		return dd.select(diaryNum);
	}

	@Override
	public int update(Diary diary) {
		
		return dd.update(diary);
	}

	@Override
	public int delete(int diaryNum) {
		
		return dd.delete(diaryNum);
	}

	@Override
	public int save(int diaryNum) {
		
		return dd.save(diaryNum);
	}

	@Override
	public int del(int diaryNum) {
		
		return dd.del(diaryNum);
	}

	@Override
	public List<Diary> typeList(int memberNum, int diaryCataNum) {
		
		return dd.typeList(memberNum,diaryCataNum);
	}

	@Override
	public int selectDiaryNum() {
	
		return dd.selectDiaryNum();
	}

	@Override
	public int insertSelect(Diary diary) {
		
		return dd.insertSelect(diary);
	}

	@Override
	public int allDel(int memberNum) {
		
		return dd.allDel(memberNum);
	}

	@Override
	public List<Integer> memberSelect(int memberNum) {
		
		return dd.memberSelect(memberNum);
	}

}
