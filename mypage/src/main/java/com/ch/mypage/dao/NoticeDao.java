package com.ch.mypage.dao;

import java.util.List;

import com.ch.mypage.model.Notice;

public interface NoticeDao {

	int insert(Notice notice);

	List<Notice> list();

	Notice select(int noticeNum);

	int update(Notice notice);

	int delete(int noticeNum);

}
