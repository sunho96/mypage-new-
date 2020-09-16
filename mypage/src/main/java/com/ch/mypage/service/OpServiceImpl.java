package com.ch.mypage.service;

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
}
