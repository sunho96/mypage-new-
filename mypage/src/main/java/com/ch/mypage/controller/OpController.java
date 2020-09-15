package com.ch.mypage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.mypage.model.ObjectPosition;
import com.ch.mypage.service.OpService;

@Controller
public class OpController {
	@Autowired
	private OpService os;
	@RequestMapping("diary/position")
	@ResponseBody
	public String decoLocation(@RequestBody List<Map> stList) {
		for (int i = 0; i < stList.size(); i++) {
			ObjectPosition op  = new ObjectPosition();
			/* op.get */
			System.out.println(stList.get(i).get("name"));
			System.out.println(stList.get(i).get("width"));
			System.out.println(stList.get(i).get("height"));
			System.out.println(stList.get(i).get("x"));
			System.out.println(stList.get(i).get("y"));
		}
		String msg="성공";
		System.out.println(stList);
		return msg;
	}

}
