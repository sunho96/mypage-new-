package com.ch.mypage.dao;

import java.util.List;

import com.ch.mypage.model.ObjectPosition;

public interface OpDao {

	int insert(ObjectPosition op);

	List<ObjectPosition> opList(int diaryNum);

	int insertTxt(ObjectPosition op);



}
