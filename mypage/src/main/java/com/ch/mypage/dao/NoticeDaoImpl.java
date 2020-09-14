package com.ch.mypage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.mypage.model.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Notice notice) {
		
		return sst.insert("noticens.insert",notice);
	}

	@Override
	public List<Notice> list() {
		
		return sst.selectList("noticens.list");
	}

	@Override
	public Notice select(int noticeNum) {
		
		return sst.selectOne("noticens.select",noticeNum);
	}

	@Override
	public int update(Notice notice) {
		
		return sst.update("noticens.update",notice);
	}

	@Override
	public int delete(int noticeNum) {
		
		return sst.delete("noticens.delete",noticeNum);
	}
}
