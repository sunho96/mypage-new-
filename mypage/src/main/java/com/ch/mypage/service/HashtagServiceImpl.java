package com.ch.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.mypage.dao.HashtagDao;

@Service
public class HashtagServiceImpl implements HashtagService{

	@Autowired
	private HashtagDao hd;
}
