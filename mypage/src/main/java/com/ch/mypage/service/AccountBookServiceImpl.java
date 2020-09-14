package com.ch.mypage.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.mypage.dao.AccountBookDao;
import com.ch.mypage.model.AccountBook;

@Service
public class AccountBookServiceImpl implements AccountBookService{
	@Autowired
	private AccountBookDao abd;

	public Collection<AccountBook> AccountBookList(int accountNum) {
		return abd.AccountBookList(accountNum);
	}

}
