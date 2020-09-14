package com.ch.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.mypage.model.Notice;
import com.ch.mypage.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService ns;

	@RequestMapping("notice/list")
	public String list(Model model) {
		List<Notice> list = ns.list();
		model.addAttribute("list",list);
		return "notice/list";
	}

	@RequestMapping("notice/insertForm")
	public String insertForm() {
		return "notice/insertForm";
	}

	@RequestMapping("notice/insert")
	public String insert(Notice notice, Model model) {
		int result = ns.insert(notice);
		model.addAttribute("result", result);
		return "notice/insert";

	}
	@RequestMapping("notice/view")
	public String select(int noticeNum, Model model) {
		Notice notice = ns.select(noticeNum);
		model.addAttribute("notice",notice);
		return "notice/view";
		
	}
	@RequestMapping("notice/updateForm")
	public String updateForm(int noticeNum,Model model) {
		Notice notice = ns.select(noticeNum);
		model.addAttribute("notice",notice);
		return "notice/updateForm";
		
	}
	@RequestMapping("notice/update")
	public String update(Notice notice, Model model) {
		int result = ns.update(notice);
		model.addAttribute("result",result);
		model.addAttribute("noticeNum",notice.getNoticeNum());
		return "notice/update";
	}
	@RequestMapping("notice/delete")
	public String delete(int noticeNum, Model model) {
		int result  = ns.delete(noticeNum);
		model.addAttribute("result", result);
		return "notice/delete";
				
	}

}
