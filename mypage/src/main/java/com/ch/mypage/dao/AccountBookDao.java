package com.ch.mypage.dao;

import java.util.Collection;

import com.ch.mypage.model.AccountBook;

public interface AccountBookDao {

	Collection<AccountBook> AccountBookList(int accountNum);

}
