package com.ch.mypage.dao;

import java.util.Collection;
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
	public List<Sticker> stickerList() {
		
		return sst.selectList("stickerns.stickerList");
	}

	@Override
	public List<Sticker> gNameList() {
		
		return sst.selectList("stickerns.gNameList");
	}

	@Override
	public Collection<Sticker> list(Sticker sticker) {
		// TODO Auto-generated method stub
		return sst.selectList("stickerns.list",sticker);
	}

	@Override
	public int getTotal(Sticker sticker) {
		// TODO Auto-generated method stub
		return sst.selectOne("stickerns.getTotal", sticker);
	}

	@Override
	public List<Sticker> opStickerList(List<Integer> stiList) {
		
		return sst.selectList("stickerns.opStickerList",stiList);
	}
}
