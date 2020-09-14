package com.ch.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.mypage.dao.NoticeDao;
import com.ch.mypage.model.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao nd;

	@Override
	public int insert(Notice notice) {
		
		return nd.insert(notice);
	}

	@Override
	public List<Notice> list() {
		
		return nd.list();
	}

	@Override
	public Notice select(int noticeNum) {
		
		return nd.select(noticeNum);
	}

	@Override
	public int update(Notice notice) {
	
		return nd.update(notice);
	}

	@Override
	public int delete(int noticeNum) {
		
		return nd.delete(noticeNum);
	}
}
