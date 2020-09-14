package com.ch.mypage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.mypage.model.Sticker;

@Repository
public class StickerDaoImpl implements StickerDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Sticker> list() {
		
		return sst.selectList("stickerns.list");
	}

	@Override
	public List<Sticker> gNameList() {
		
		return sst.selectList("stickerns.gNameList");
	}
}
