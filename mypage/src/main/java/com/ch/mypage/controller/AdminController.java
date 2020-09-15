package com.ch.mypage.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.mypage.model.Member;
import com.ch.mypage.util.WebConstants;

@Controller
public class AdminController {
	@RequestMapping(value = "adminMain")
	public String admin(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
		}
		return "admin/adminMain";
	}
}
