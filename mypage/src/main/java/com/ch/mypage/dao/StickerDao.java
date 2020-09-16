package com.ch.mypage.dao;

import java.util.Collection;
import java.util.List;

import com.ch.mypage.model.Sticker;

public interface StickerDao {

	List<Sticker> stickerList();

	List<Sticker> gNameList();
	

	Collection<Sticker> list(Sticker sticker);

	int getTotal(Sticker sticker);

	List<Sticker> opStickerList(List<Integer> stiList);
}
