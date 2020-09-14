package com.ch.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.mypage.model.DiaryCatagory;
import com.ch.mypage.model.MemAndCata;
import com.ch.mypage.service.DiaryCataService;

@Controller
public class DiaryCataController {

	@Autowired
	private DiaryCataService dcs;

	@RequestMapping("diaryCatagory/list")
	public String list(Model model, HttpSession session) {
		int memberNum = (Integer) session.getAttribute("memberNum");
		List<MemAndCata> cataList = dcs.cataList(memberNum);
		model.addAttribute("cataList", cataList);
		return "diaryCatagory/list";
	}

	@RequestMapping("diaryCatagory/insert")
	public String insert(String name, Model model, HttpSession session, String insertForm) {
		int memberNum = (int) session.getAttribute("memberNum");
		DiaryCatagory dc = dcs.selectCata(name); // 중복 체크
		
		if (dc == null) { // name 중복 없음
			dcs.insertCata(name); // catagory insert
			DiaryCatagory dc2 = dcs.selectCata(name); //memAndCata에 넣을 cataNum 추출
			int result = dcs.insertMemAndCata(memberNum, dc2.getDiaryCataNum()); // memAndCata insert
			model.addAttribute("result", result); //1 전송
		} else if (dc != null) { // name이 이미 존재할 때
			MemAndCata mc = dcs.selectMemAndCata(dc.getDiaryCataNum(), memberNum);// member가 name을 사용 중인지 체크
			if (mc == null) { // memandcata에 값이 없을 대
				int result = dcs.insertMemAndCata(memberNum, dc.getDiaryCataNum());// membercata에 insert
				model.addAttribute("result", result);
			} else if (mc != null) { // memandcata에 값이 있을 때 즉, 사용자가 사용중인 catagory일 때
				int result = -1;
				model.addAttribute("result", result);
			}
		}
		if (insertForm == null) {
			return "diaryCatagory/insert"; //insertForm으로 안 들어올 때
		} else {
			return "diaryCatagory/insert2"; //insertForm에서 들어올 때
		}
	}
	@RequestMapping("diaryCatagory/del")
	public String del(int diaryCataNum, int memberNum, Model model) {
		int result = dcs.memAnaCataDel(memberNum, diaryCataNum);
		model.addAttribute("result", result);
		return "diaryCatagory/del";
	}

	@RequestMapping("diaryCatagory/allDel")
	public String allDel(int memberNum, Model model) {
		int result = dcs.memAndCataAllDel(memberNum);
		model.addAttribute("result", result);
		return "diaryCatagory/del";
	}

	@RequestMapping("diaryCatagory/update")
	public String update(int memberNum, String name, int diaryCataNum, Model model) {
		// select
		DiaryCatagory dc = dcs.selectCata(name);
		
		int result = 0;
		if (dc == null) {
			dcs.memAnaCataDel(memberNum, diaryCataNum); 
			dcs.insertCata(name); 
			DiaryCatagory dc2 = dcs.selectCata(name); 
			result = dcs.insertMemAndCata(memberNum, dc2.getDiaryCataNum()); 
			model.addAttribute("result", result);
		} else { 
			MemAndCata mc = dcs.selectMemAndCata(dc.getDiaryCataNum(), memberNum);
			if (mc == null) { 
				dcs.memAnaCataDel(memberNum, diaryCataNum); 
				result = dcs.insertMemAndCata(memberNum,dc.getDiaryCataNum());
			} else if(mc != null) { 
				result = -1;
				model.addAttribute("result", result);
			}

			
		}
		return "diaryCatagory/update";

	}

}
