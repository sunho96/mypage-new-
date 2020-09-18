package com.ch.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.mypage.dao.OpDao;
import com.ch.mypage.model.ObjectPosition;

@Service
public class OpServiceImpl implements OpService {

	@Autowired
	private OpDao od;

	@Override
	public int insert(ObjectPosition op) {
	
		return od.insert(op);
	}

	@Override
	public List<ObjectPosition> opList(int diaryNum) {
		
		return od.opList(diaryNum);
	}

	@Override
	public int insertTxt(ObjectPosition op) {
		
		return od.insertTxt(op);
	}
}
