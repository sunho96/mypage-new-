package com.ch.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.mypage.model.Sticker;
import com.ch.mypage.service.StickerService;

@Controller
public class StickerController {
	@Autowired
	private StickerService ss;
	@RequestMapping("sticker/list")
	public String list(Model model) {
		List<Sticker> stickerList= ss.list();
		List<Sticker> stickerGName = ss.gNameList();
		model.addAttribute("stickerList",stickerList);
		model.addAttribute("stickerGName",stickerGName);
		return "sticker/list";
		
	}
}
