package com.ch.mypage.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.mypage.model.Diary;
import com.ch.mypage.model.MemAndCata;
import com.ch.mypage.model.ObjectPosition;
import com.ch.mypage.model.Sticker;
import com.ch.mypage.service.DiaryCataService;
import com.ch.mypage.service.DiaryService;
import com.ch.mypage.service.OpService;
import com.ch.mypage.service.StickerService;

@Controller
public class DiaryController {
	@Autowired
	private DiaryService ds;
	@Autowired
	private DiaryCataService dcs;
	@Autowired
	private StickerService ss;
	@Autowired
	private OpService os;

	@RequestMapping("diary/insertForm")
	public String insertForm(Model model, HttpSession session) {
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		List<MemAndCata> cataList = dcs.cataList(memberNum);
		model.addAttribute("cataList", cataList);
		List<Sticker> stickerList = ss.stickerList();
		List<Sticker> stickerGName = ss.gNameList();
		model.addAttribute("stickerList", stickerList);
		model.addAttribute("stickerGName", stickerGName);
		return "diary/insertForm";
	}

	@RequestMapping("diary/insert")
	public String insert(Diary diary, Model model) {
		System.out.println("여기 들어오나..");
		int result = ds.insert(diary);
		model.addAttribute("result", result);
		return "diary/insert";
	}

	@RequestMapping("diary/list")
	public String list(HttpSession session, Model model) {
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		List<Diary> list = ds.list(memberNum);
		List<MemAndCata> cataList = dcs.cataList(memberNum);
		model.addAttribute("cataList", cataList);
		model.addAttribute("list", list);
		return "diary/list";
	}

	@RequestMapping("diary/view")
	public String view(int diaryNum, Model model) {
		Diary diary = ds.select(diaryNum);
		List<ObjectPosition> opList = os.opList(diaryNum);
		List<Integer> stiList = new ArrayList<Integer>();
		for (int i = 0; i < opList.size(); i++) {
			stiList.add(opList.get(i).getStickerNum());			
		}
		if (stiList.size() != 0) {
			List<Sticker> opStickerList = ss.opStickerList(stiList);
			model.addAttribute("opStickerList", opStickerList);
		}
		model.addAttribute("diary", diary);
		model.addAttribute("opList", opList);

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
		model.addAttribute("diaryCataNum", diaryCataNum);
		model.addAttribute("cataList", cataList);
		model.addAttribute("typeList", typeList);
		model.addAttribute("m", "tList");
		return "diary/typeList";
	}

///main#diaryList?memberNum="+memberNum+"&diaryCataNum="+diaryCataNum
	@RequestMapping("diary/location")
	public String location(int width, int height, int x, int y, Model model) {
		model.addAttribute("width", width);
		model.addAttribute("height", height);
		model.addAttribute("x", x);
		model.addAttribute("y", y);
		return "diary/location";
	}

	@RequestMapping(value = "diary/decorate", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String decoLocation(@RequestBody List<Map> stList, HttpSession session) {
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		Diary d = new Diary();
		ObjectPosition op = new ObjectPosition();
		int diaryNum = 0;
		System.out.println(stList);
		int result = 0;
		String msg = "";
		for (int i = 0; i < stList.size(); i++) {
			if (i == 0) {
				d.setSubject((String) stList.get(i).get("subject"));
				d.setDiaryCataNum(Integer.parseInt((String) stList.get(i).get("diaryCataNum")));
				d.setBgColor((String) stList.get(i).get("bgColor"));
				d.setContent((String) stList.get(i).get("content"));
				d.setMemberNum(memberNum);
				diaryNum = ds.insertSelect(d);
			} else if (i > 0) {
				System.out.println("stickerNum=" + stList.get(i).get("stickerNum"));
				op.setStickerNum((int) stList.get(i).get("stickerNum"));
				if (stList.get(i).get("width") instanceof Integer) {
					op.setWidth((int) stList.get(i).get("width"));
				} else if (stList.get(i).get("x") instanceof Double) {
					op.setWidth((double) stList.get(i).get("width"));
				}
				if (stList.get(i).get("height") instanceof Integer) {
					op.setHeight((int) stList.get(i).get("height"));
				} else if (stList.get(i).get("height") instanceof Double) {
					op.setHeight((double) stList.get(i).get("height"));
				}
				if (stList.get(i).get("x") instanceof Integer) {
					op.setX((int) stList.get(i).get("x"));
				} else if (stList.get(i).get("x") instanceof Double) {
					op.setX((double) stList.get(i).get("x"));
				}
				if (stList.get(i).get("y") instanceof Integer) {
					op.setY((int) stList.get(i).get("y"));
				} else if (stList.get(i).get("y") instanceof Double) {
					op.setY((double) stList.get(i).get("y"));
				}
				op.setDiaryNum(diaryNum);

				// op.setStickerNum((int) stList.get(i).get("stickerNum"));
				/* op.setDiaryNum((int) stList.get(i).get("num")); */
				result = os.insert(op);
			}
		}
		if (result == 1) {
			msg = "1";
		} else {
			msg = "0";
		}
		return msg;
	}

	@RequestMapping("diary/allDel")
	public String allDel(int memberNum, Model model) {
		int result = ds.allDel(memberNum);
		model.addAttribute("result", result);
		return "diary/del";
	}

	@RequestMapping("diary/content")
	public String content(int colorNum, String content) {
		System.out.println("들어왔음");
		return "diary/content";

	}
}
