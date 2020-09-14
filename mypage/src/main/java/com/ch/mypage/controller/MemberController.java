package com.ch.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.mypage.model.Member;
import com.ch.mypage.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping("login")
	public String login(Member member, Model model, HttpSession session) {
		int result = 0;
		Member mem = ms.select(member.getEmail());
		if (mem == null) { // �씠硫붿씪�씠 寃��깋�씠 �븞�맂 寃쎌슦
			result = -1;
		} else {// �씠硫붿씪�씠 寃��깋�맂 寃쎌슦
			if (mem.getPassword().equals(member.getPassword())) { // 鍮꾨�踰덊샇源뚯� 留욌뒗 寃쎌슦
				result = 1;
				//�꽭�뀡
				session.setAttribute("memberNum", mem.getMemberNum());
				model.addAttribute("member", member);
			}
		}
		model.addAttribute("result", result);
		return "member/login";
	}

	@RequestMapping("main")
	public String main(HttpSession session, Model model) {
		int memberNum = Integer.parseInt((String)session.getAttribute("memberNum"));
		Member member = ms.selectMember(memberNum);
		model.addAttribute("member",member);
		return "main";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/loginForm";
	}
	
	@RequestMapping(value="emailChk.do",  produces = "text/html;charset=utf-8")
	@ResponseBody
	public String emailChk(String email) {
		String msg="";
		
		Member member = ms.select(email);
		if(member == null) {
			msg = "�궗�슜媛��뒫";
		}else {
			msg = "�궗�슜遺덇�";
		}
		return msg;
	}

	@RequestMapping(value="join.do" , method = RequestMethod.POST)
	public String join(Member member, Model model ) {
		int result =0;
		Member mem = ms.select(member.getEmail());
		
		if(mem== null) {
			result= ms.insert(member);
		}else result=-1;
		
		model.addAttribute("result", result);
		model.addAttribute("member", member);
		
		return "member/join";
	}
	@RequestMapping(value="memberUpdate_form", produces = "text/html;charset=utf-8")
	public String memberUpdate_form(Model model, HttpSession session) {
		int memberNum = Integer.parseInt((String)session.getAttribute("memberNum"));
		Member member = ms.selectMember(memberNum); // �씫怨� 
		model.addAttribute("member", member); // 媛믪쓣 �뤌�뿉 ���엯
		return "member/memberUpdate_form";

	}
	@RequestMapping(value="memberUpdate", produces = "text/html;charset=utf-8")
	public String memberUpdate(Member member,Model model) {
		int result = ms.update(member);
		model.addAttribute("result", result);
		model.addAttribute("member", member);
		return "member/memberUpdate";
		
	}

}
