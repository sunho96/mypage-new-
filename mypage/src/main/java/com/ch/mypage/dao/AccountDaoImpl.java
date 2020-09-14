package com.ch.mypage.dao;

import java.util.Collection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.mypage.model.Account;

@Repository
public class AccountDaoImpl implements AccountDao {
	@Autowired
	private SqlSessionTemplate sst;

	public Collection<Account> AccountList(int memberNum) {
		return sst.selectList("accountns.AccountList", memberNum);
	}

	public int AccountInsert(Account account) {
		return sst.insert("accountns.AccountInsert", account);
	}

	public Account accountNumChk(int accountNum) {
		return sst.selectOne("accountns.accountNumChk", accountNum);
	}

}
