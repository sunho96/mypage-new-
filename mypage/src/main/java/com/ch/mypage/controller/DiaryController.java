package com.ch.mypage.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ch.mypage.model.Diary;
import com.ch.mypage.model.MemAndCata;
import com.ch.mypage.model.Sticker;
import com.ch.mypage.service.DiaryCataService;
import com.ch.mypage.service.DiaryService;
import com.ch.mypage.service.StickerService;

@Controller
public class DiaryController {
	@Autowired
	private DiaryService ds;
	@Autowired
	private DiaryCataService dcs;
	@Autowired
	private StickerService ss;

	@RequestMapping("diary/insertForm")
	public String insertForm(Model model,HttpSession session) {
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		List<MemAndCata> cataList = dcs.cataList(memberNum);
		model.addAttribute("cataList",cataList);
		return "diary/insertForm";
	}
	
	@RequestMapping("diary/decorate")
	public String decorate(int diaryCataNum, String subject,Model model) {
		List<Sticker> stickerList= ss.list();
		List<Sticker> stickerGName = ss.gNameList();
		model.addAttribute("stickerList",stickerList);
		model.addAttribute("stickerGName",stickerGName);
		model.addAttribute("subject",subject);
		return "diary/decorate";
	}

	@RequestMapping("diary/insert")
	public String insert(Diary diary, Model model) {
		int result = ds.insert(diary);
		model.addAttribute("result", result);
		return "diary/insert";
	}

	@RequestMapping("diary/list")
	public String list(HttpSession session, Model model) {
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		List<Diary> list = ds.list(memberNum);
		List<MemAndCata> cataList=dcs.cataList(memberNum); 
		model.addAttribute("cataList", cataList);
		model.addAttribute("list", list);
		return "diary/list";
	}

	@RequestMapping("diary/view")
	public String view(int diaryNum, Model model) {
		Diary diary = ds.select(diaryNum);
		model.addAttribute("diary", diary);
		return "diary/view";
	}

	@RequestMapping("diary/updateForm")
	public String updateForm(int diaryNum, Model model) {
		Diary diary = ds.select(diaryNum);
		model.addAttribute("diary", diary);
		return "diary/updateForm";
	}

	@RequestMapping("diary/update")
	public String update(Diary diary, Model model) {
		int result = ds.update(diary);
		model.addAttribute("result", result);
		return "diary/update";
	}

	@RequestMapping("diary/delete")
	public String delete(int diaryNum, Model model) {
		int result = ds.delete(diaryNum);
		model.addAttribute("result", result);
		return "diary/delete";
	}

	@RequestMapping("diary/trash")
	public String trash(HttpSession session, Model model) {
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		List<Diary> list = ds.list(memberNum);
		model.addAttribute("list", list);
		return "diary/trash";
	}

	@RequestMapping("diary/save")
	public String save(int diaryNum, Model model) {
		int result = ds.save(diaryNum);
		model.addAttribute("result", result);
		return "diary/save";

	}

	@RequestMapping("diary/del")
	public String del(int diaryNum, Model model) {
		int result = ds.del(diaryNum);
		model.addAttribute("result", result);
		return "diary/del";
	}

	@RequestMapping("diary/typeList")
	public String typeList(int memberNum, int diaryCataNum, Model model) {
		List<Diary> typeList = ds.typeList(memberNum, diaryCataNum);
		List<MemAndCata> cataList = dcs.cataList(memberNum);
		model.addAttribute("diaryCataNum",diaryCataNum);
		model.addAttribute("cataList", cataList);
		model.addAttribute("typeList", typeList);
		return "diary/typeList";
	}

	@RequestMapping("diary/location")
	public String location(int width, int height, int x,int y,Model model) {
		model.addAttribute("width",width);
		model.addAttribute("height",height);
		model.addAttribute("x",x);
		model.addAttribute("y",y);
		return "diary/location";
	}
	@RequestMapping("diary/decoLocation")
	public String decoLocation() {
		return null;
		
	}
	
}
