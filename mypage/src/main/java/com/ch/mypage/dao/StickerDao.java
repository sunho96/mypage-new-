package com.ch.mypage.dao;

import java.util.List;

import com.ch.mypage.model.Sticker;

public interface StickerDao {

	List<Sticker> list();

	List<Sticker> gNameList();

}
