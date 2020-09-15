package com.ch.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.mypage.service.HashtagService;

@Controller
public class HashtagController {
@Autowired
private HashtagService hs;

@RequestMapping("hash/hashTag")
public String hashTag() {
	return "hash/hashTag";
}
	
	
}
