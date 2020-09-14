package com.ch.mypage.dao;

import java.util.Collection;

import com.ch.mypage.model.Account;

public interface AccountDao {

	Collection<Account> AccountList(int memberNum);

	int AccountInsert(Account account);

	Account accountNumChk(int accountNum);

}
