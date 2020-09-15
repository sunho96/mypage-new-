package com.ch.mypage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HashtagDaoImpl implements HashtagDao{
	@Autowired
	private SqlSessionTemplate sst;
	
	
}
