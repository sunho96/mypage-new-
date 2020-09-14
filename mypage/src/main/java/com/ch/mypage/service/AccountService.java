package com.ch.mypage.service;

import java.util.Collection;

import com.ch.mypage.model.Account;

public interface AccountService {

	Collection<Account> AccountList(int memberNum);

	int AccountInsert(Account account);

	Account accountNumChk(int accountNum);

}
