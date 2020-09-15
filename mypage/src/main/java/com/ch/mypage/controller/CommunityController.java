package com.ch.mypage.controller;


import java.io.Console;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.mypage.model.Community;
import com.ch.mypage.model.CommunityComments;
import com.ch.mypage.model.CommunityLikey;
import com.ch.mypage.model.Member;
import com.ch.mypage.service.CommunityService;
import com.ch.mypage.service.DiaryService;
import com.ch.mypage.service.MemberService;

@Controller
public class CommunityController {
	@Autowired
	private CommunityService cs;
	@Autowired
	private DiaryService ds;
	@Autowired
	private MemberService ms;

	
	@RequestMapping("communityHome")
	public String home(Model model, HttpSession session) {
		//테스트용 세션
		session.setAttribute("memberNum","1");
		int memberNum = Integer.parseInt((String)session.getAttribute("memberNum"));
		Collection<Community> list = cs.listDefault();
		
		//memberNum이 좋아요 한 리스트
		Collection<CommunityLikey> isLikeyList = cs.isLikeyList(memberNum);
		
		//list 넘기기
		model.addAttribute("list", list);
		model.addAttribute("isLikeyList", isLikeyList);
		return "community/home";
	}

	@RequestMapping(value = "addCoummunityList", method = RequestMethod.POST)
	@ResponseBody
	public Collection<Community> addCoummunityList(int startNum) {
		Collection<Community> list = cs.addList(startNum);		
		
		//@ResponseBody로 리턴하면 spring에서 허용된 형식의 데이터를 반환
		//								 혀용된 형식의 데이터가 아니면 json으로 반환하는듯 
		return list;
	}
	
	@RequestMapping("communitySeek")
	public String communitySeek(Model model) {
		Collection<Community> list = cs.listDefault();		
		model.addAttribute("list", list);
		return "community/seekForm";
	}
	
	//좋아요버튼 클릭시
	@RequestMapping(value="communityLikey", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> communityLikey(int communityNum, Model model, HttpSession session) {
		int result= 0;
		int memberNum = Integer.parseInt((String)session.getAttribute("memberNum"));
		Map<String, Integer>  map = new HashMap<String, Integer>();
		
		//좋아요 했는지 여부에 따라 추가 or 삭제함
		CommunityLikey likeyChk = cs.selectLikey(memberNum, communityNum);
		if(likeyChk == null) {
			result = cs.insertLikey(memberNum,communityNum);
		}else {
			result = -cs.deleteLikey(memberNum,communityNum);
		}
		
		//좋아요개수 검색
		int likeyCnt = cs.likeyCnt(communityNum);
		
		map.put("result", result);
		map.put("likeyCnt", likeyCnt);
		return map;
	}
	
	@RequestMapping(value ="writeComment",method = RequestMethod.POST)
	@ResponseBody
	public CommunityComments writeComment(CommunityComments comment, HttpSession session, Model model) {
		int memberNum = Integer.parseInt((String)session.getAttribute("memberNum"));
		comment.setMemberNum(memberNum);
		int result = cs.insertComment(comment); 
		
		//댓글 최신순으로 가져오기
		Collection<CommunityComments> list = cs.commentsList(comment.getCommunityNum()); 
		
		//닉네임 가져오기
		Member member = ms.selectMember(memberNum);
		comment.setNickName(member.getNickName());
		
		return comment ;
	}
	
	
}
