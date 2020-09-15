package com.ch.mypage.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.mypage.dao.StickerDao;
import com.ch.mypage.model.Sticker;

@Service
public class StickerServiceImpl implements StickerService {
	@Autowired
	private StickerDao sd;

	@Override
	public List<Sticker> stickerList() {
		
		return sd.stickerList();
	}

	@Override
	public List<Sticker> gNameList() {
		
		return sd.gNameList();
	}

	@Override
	public Collection<Sticker> list(Sticker sticker) {
		return sd.list(sticker);
	}

	@Override
	public int getTotal(Sticker sticker) {
		// TODO Auto-generated method stub
		return sd.getTotal(sticker);
	}
}
