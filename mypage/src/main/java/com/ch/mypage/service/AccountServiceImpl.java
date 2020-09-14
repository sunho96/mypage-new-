package com.ch.mypage.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.mypage.dao.AccountDao;
import com.ch.mypage.model.Account;

@Service
public class AccountServiceImpl implements AccountService{
	@Autowired
	private AccountDao ad;

	public Collection<Account> AccountList(int memberNum) {
		return ad.AccountList(memberNum);
	}

	public int AccountInsert(Account account) {
		return ad.AccountInsert(account);
	}

	public Account accountNumChk(int accountNum) {
		return ad.accountNumChk(accountNum);
	}

}
