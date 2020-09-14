package com.ch.mypage.dao;

import java.util.Collection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.mypage.model.AccountBook;

@Repository
public class AccountBookDaoImpl implements AccountBookDao {
	@Autowired
	private SqlSessionTemplate sst;

	public Collection<AccountBook> AccountBookList(int accountNum) {
		return sst.selectList("accountbookns.AccountBookList", accountNum);
	}

}
