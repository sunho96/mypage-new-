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
import com.ch.mypage.service.DiaryService;

@Controller
public class DiaryCataController {

	@Autowired
	private DiaryCataService dcs;
	@Autowired
	private DiaryService ds;

	@RequestMapping("diaryCatagory/list")
	public String list(Model model, HttpSession session) {
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		List<MemAndCata> cataList = dcs.cataList(memberNum);
		model.addAttribute("cataList", cataList);
		return "diaryCatagory/list";
	}

	@RequestMapping("diaryCatagory/insert")
	public String insert(String name, Model model, HttpSession session, String insertForm) {
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		DiaryCatagory dc = dcs.selectCata(name); // 중복 체크
		int result = 0;
		if (dc == null) { // name 중복 없음
			dcs.insertCata(name); // catagory insert
			DiaryCatagory dc2 = dcs.selectCata(name); // memAndCata에 넣을 cataNum 추출
			result = dcs.insertMemAndCata(memberNum, dc2.getDiaryCataNum()); // memAndCata insert

		} else if (dc != null) { // name이 이미 존재할 때
			MemAndCata mc = dcs.selectMemAndCata(dc.getDiaryCataNum(), memberNum);// member가 name을 사용 중인지 체크
			if (mc == null) { // memandcata에 값이 없을 대
				result = dcs.insertMemAndCata(memberNum, dc.getDiaryCataNum());// membercata에 insert
			} else if (mc != null) { // memandcata에 값이 있을 때 즉, 사용자가 사용중인 catagory일 때
				result = -1;
			}
		}
		model.addAttribute("result", result); // 1 전송
		System.out.println("result = " + result);
		if (insertForm != null) {
			return "diaryCatagory/insert2"; // insertForm에서 들어올 때
		} /*
			 * else if (diaryNum!= 0) { model.addAttribute("diaryNum",diaryNum); return
			 * "diaryCatagory/insert3" ; }
			 */
		return "diaryCatagory/insert";
	}

	@RequestMapping("diaryCatagory/del")
	public String del(int diaryCataNum, int memberNum, Model model) {
		int result=0;
		String name = "기타";
		int gitaNum = dcs.selectGitaNum(name); //기타 번호 추출
		MemAndCata mc = dcs.selectMemAndCata(gitaNum, memberNum); //기타가지고 있는지 확인
		if(mc == null) {
			System.out.println("1");
			result = dcs.updateMemAndCata(memberNum,gitaNum); //카테고리 삭제하기 전 기타 카테고리 만들어주기
			System.out.println("updateMemandcat result="+result);
			result = ds.updateCataGita(diaryCataNum,gitaNum); //삭제된 다이어리 카테고리 기타로 변경
			System.out.println("updateCataGita result1="+result);
		}else {
			System.out.println("2");
			result = ds.updateCataGita(diaryCataNum,gitaNum); //삭제된 다이어리 카테고리 기타로 변경
			result = dcs.memAnaCataDel(diaryCataNum, memberNum);
		}	
		
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
	public String update(String name, int diaryCataNum, Model model, HttpSession session) {
		// select
		DiaryCatagory dc = dcs.selectCata(name); // name 중복 체크
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString()); // memAndCata에 넣기 위해
		int result = 0;
		if (dc == null) { // 중복된 name이 없을 때
			dcs.memAnaCataDel(memberNum, diaryCataNum); // 원래 있던 memAndCata 데이터 삭제
			dcs.insertCata(name); // 그리고 catagory테이블에 데이터 추가
			DiaryCatagory dc2 = dcs.selectCata(name); // memAndCata에 데이터 넣기 위해 카테고리 테이블에서 num select
			result = dcs.insertMemAndCata(memberNum, dc2.getDiaryCataNum());
			model.addAttribute("result", result);
		} else {
			MemAndCata mc = dcs.selectMemAndCata(dc.getDiaryCataNum(), memberNum);
			if (mc == null) {
				dcs.memAnaCataDel(memberNum, diaryCataNum);
				result = dcs.insertMemAndCata(memberNum, dc.getDiaryCataNum());
			} else if (mc != null) {
				result = -1;
				model.addAttribute("result", result);
			}
		}
		return "diaryCatagory/update";

	}

}
