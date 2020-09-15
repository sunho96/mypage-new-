package com.ch.mypage.service;

import java.util.Collection;
import java.util.List;

import com.ch.mypage.model.Sticker;

public interface StickerService {

	List<Sticker> stickerList();

	List<Sticker> gNameList();
	
	Collection<Sticker> list(Sticker sticker);

	int getTotal(Sticker sticker);


}
