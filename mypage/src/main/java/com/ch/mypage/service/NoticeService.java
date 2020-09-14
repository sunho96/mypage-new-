package com.ch.mypage.service;

import java.util.List;

import com.ch.mypage.model.Notice;

public interface NoticeService {

	int insert(Notice notice);

	List<Notice> list();

	Notice select(int noticeNum);

	int update(Notice notice);

	int delete(int noticeNum);

}
