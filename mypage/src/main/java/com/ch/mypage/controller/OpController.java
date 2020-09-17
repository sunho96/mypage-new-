package com.ch.mypage.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import com.ch.mypage.model.Textbox;
import com.ch.mypage.service.OpService;

@Controller
public class OpController {
	@Autowired
	private OpService os;
	/*
	 * @RequestMapping("op/position") public String postion(List<Textbox>
	 * textboxList) { return null; }
	 */
	

}
