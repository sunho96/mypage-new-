package com.ch.mypage.service;

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
	public List<Sticker> list() {
		
		return sd.list();
	}

	@Override
	public List<Sticker> gNameList() {
		
		return sd.gNameList();
	}
}
