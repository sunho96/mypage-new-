package com.ch.mypage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.mypage.model.ObjectPosition;

@Repository
public class OpDaoImpl implements OpDao {

	@Autowired	
	 private SqlSessionTemplate sst;

	@Override
	public int insert(ObjectPosition op) {
		
		return sst.insert("opns.insert",op);
	}

	@Override
	public List<ObjectPosition> opList(int diaryNum) {
	
		return sst.selectList("opns.opList",diaryNum);
	}

	@Override
	public int insertTxt(ObjectPosition op) {
		
		return sst.insert("opns.insertTxt",op);
	}


}
