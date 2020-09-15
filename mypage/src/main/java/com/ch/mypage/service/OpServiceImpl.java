package com.ch.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.mypage.dao.OpDao;

@Service
public class OpServiceImpl implements OpService {

	@Autowired
	private OpDao od;
}
