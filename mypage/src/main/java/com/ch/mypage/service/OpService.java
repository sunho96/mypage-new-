package com.ch.mypage.service;

import java.util.List;

import com.ch.mypage.model.Diary;
import com.ch.mypage.model.ObjectPosition;

public interface OpService {

	int insert(ObjectPosition op);

	List<ObjectPosition> opList(int diaryNum);

	int insertTxt(ObjectPosition op);

	int delete(int diaryNum);

	int allDel(List<Integer> diaryNumList);

}
