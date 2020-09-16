package com.ch.mypage.controller;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.mypage.model.Sticker;
import com.ch.mypage.service.PagingBean;
import com.ch.mypage.service.StickerService;

@Controller
public class StickerSearchController {
	
	@Autowired
	private StickerService ss;
	
	// 스티커 검색 
		@RequestMapping("/sticker/stickerSearch/pageNum/{pageNum}")
		public String stickerSearch(@PathVariable String pageNum,Sticker sticker, Model model){
			if (pageNum == null || pageNum.equals("")) pageNum = "1";
			System.out.println("pageNum="+pageNum);

			int currentPage = Integer.parseInt(pageNum);
			int rowPerPage  = 5;
			int total = ss.getTotal(sticker); 
			int startRow = (currentPage - 1) * rowPerPage + 1;
			int endRow = startRow + rowPerPage - 1;
			int no = total - startRow + 1; // 페이지별 시작번호
			sticker.setStartRow(startRow);
			sticker.setEndRow(endRow);
			
			Collection<Sticker> list = ss.list(sticker);
			
			PagingBean pb = new PagingBean(currentPage,rowPerPage,total); 
			model.addAttribute("list", list); // 가져온 것
			model.addAttribute("no", no);
			model.addAttribute("pb", pb);
			model.addAttribute("sticker1", sticker); // 화면 입력 
			return "sticker/stickerSearch";
		}	
		
		// 이미지 출력 
		@RequestMapping("/sticker/stickerSearch")
		public String stickerSearch1(Sticker sticker, Model model){
			int currentPage = 1;
			int rowPerPage  = 5;
			int total = ss.getTotal(sticker); 
			int startRow = (currentPage - 1) * rowPerPage + 1;
			int endRow = startRow + rowPerPage - 1;
			int no = total - startRow + 1; // 페이지별 시작번호
			sticker.setStartRow(startRow);
			sticker.setEndRow(endRow);
			
			Collection<Sticker> list = ss.list(sticker);
			
			PagingBean pb = new PagingBean(currentPage,rowPerPage,total); 
			model.addAttribute("list", list); // 가져온 것
			model.addAttribute("no", no);
			model.addAttribute("pb", pb);
			model.addAttribute("sticker1", sticker); // 화면 입력 
			return "sticker/stickerImage";
		}	


}
