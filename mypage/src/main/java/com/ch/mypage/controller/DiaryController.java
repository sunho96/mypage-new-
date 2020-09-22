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
import com.ch.mypage.model.Textbox;
import com.ch.mypage.service.DiaryCataService;
import com.ch.mypage.service.DiaryService;
import com.ch.mypage.service.OpService;
import com.ch.mypage.service.StickerService;
import com.ch.mypage.service.TxtService;

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
	@Autowired
	private TxtService ts;

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
	
	
	@RequestMapping("diary/list2")
	public String list2(HttpSession session,Model model) {
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		List<Diary> list = ds.list(memberNum);
		return null;
		
	}
	
	@RequestMapping("diary/view")
	public String view(int diaryNum, Model model) {
		Diary diary = ds.select(diaryNum);
		List<ObjectPosition> opList = os.opList(diaryNum);
		List<Integer> stiList = new ArrayList<Integer>();
		List<Integer> txtList = new ArrayList<Integer>();
		for (int i = 0; i < opList.size(); i++) {
			if(opList.get(i).getStickerNum() !=0) {
				stiList.add(opList.get(i).getStickerNum());
			}
			if(opList.get(i).getTextboxNum() != 0) {
				txtList.add(opList.get(i).getTextboxNum());
			}
		}
		if (stiList.size() != 0) {
			List<Sticker> opStickerList = ss.opStickerList(stiList);
			model.addAttribute("opStickerList", opStickerList);
		}
		if (txtList.size() != 0) {
			List<Textbox> opTxtList = ts.opTxtList(txtList);
			model.addAttribute("opTxtList", opTxtList);
		}
		model.addAttribute("diary", diary);
		model.addAttribute("opList", opList);

		return "diary/view";
	}

	@RequestMapping("diary/updateForm")
	public String updateForm(int diaryNum, Model model, HttpSession session) {
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		List<MemAndCata> cataList = dcs.cataList(memberNum);
		model.addAttribute("cataList", cataList);
		List<Sticker> stickerList = ss.stickerList();
		List<Sticker> stickerGName = ss.gNameList();
		model.addAttribute("stickerList", stickerList);
		model.addAttribute("stickerGName", stickerGName);
		Diary diary = ds.select(diaryNum);
		List<ObjectPosition> opList = os.opList(diaryNum);
		List<Integer> stiList = new ArrayList<Integer>();
		List<Integer> txtList = new ArrayList<Integer>();
		for (int i = 0; i < opList.size(); i++) {
			stiList.add(opList.get(i).getStickerNum());
			txtList.add(opList.get(i).getTextboxNum());
		}
		if (stiList.size() != 0) {
			List<Sticker> opStickerList = ss.opStickerList(stiList);
			model.addAttribute("opStickerList", opStickerList);
		}
		if (txtList.size() != 0) {
			List<Textbox> opTxtList = ts.opTxtList(txtList);
			model.addAttribute("opTxtList", opTxtList);
		}
		model.addAttribute("diary", diary);
		model.addAttribute("opList", opList);
		return "diary/updateForm";
	}

	@RequestMapping(value = "diary/updateDeco", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String updateDeco(@RequestBody List<Map> allList, HttpSession session) {
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		Diary d = new Diary();
		ObjectPosition op = new ObjectPosition();
		Textbox t = new Textbox();
		System.out.println(allList);
		int result = 0;
		String msg = "";
		for (int i = 0; i < allList.size(); i++) {
			if (i == 0) {
				d.setDiaryNum( (int) allList.get(i).get("diaryNum"));
				d.setSubject((String) allList.get(i).get("subject"));
				d.setDiaryCataNum(Integer.parseInt((String) allList.get(i).get("diaryCataNum")));
				d.setBgColor((String) allList.get(i).get("bgColor"));
				d.setMemberNum(memberNum);
				result = ds.update(d);
				result = os.delete(d.getDiaryNum());
			} else if (i > 0) {
				if (allList.get(i).containsKey("st")) {
					op.setStickerNum((int) allList.get(i).get("stickerNum"));
					if (allList.get(i).get("stWidth") instanceof Integer) {
						op.setWidth((int) allList.get(i).get("stWidth"));
					} else if (allList.get(i).get("stWidth") instanceof Double) {
						op.setWidth((double) allList.get(i).get("stWidth"));
					}
					if (allList.get(i).get("stHeight") instanceof Integer) {
						op.setHeight((int) allList.get(i).get("stHeight"));
					} else if (allList.get(i).get("stHeight") instanceof Double) {
						op.setHeight((double) allList.get(i).get("stHeight"));
					}
					if (allList.get(i).get("stX") instanceof Integer) {
						op.setX((int) allList.get(i).get("stX"));
					} else if (allList.get(i).get("stX") instanceof Double) {
						op.setX((double) allList.get(i).get("stX"));
					}
					if (allList.get(i).get("stY") instanceof Integer) {
						op.setY((int) allList.get(i).get("stY"));
					} else if (allList.get(i).get("stY") instanceof Double) {
						op.setY((double) allList.get(i).get("stY"));
					}
					op.setDiaryNum(d.getDiaryNum());
					result = os.insert(op);
				} else if (allList.get(i).containsKey("txt")) {
					ObjectPosition op2 = new ObjectPosition();
					t.setContent((String) allList.get(i).get("content"));
					t.setFntSize((String) (allList.get(i).get("fntSize")));
					t.setFntColor((String) allList.get(i).get("fntColor"));
					t.setFntWeight(Integer.parseInt((String) allList.get(i).get("fntWeight")));
					int textboxNum = ts.insert(t);
					if (textboxNum != 0) {
						if (allList.get(i).get("txtWidth") instanceof Integer) {
							op2.setWidth((int) allList.get(i).get("txtWidth"));
						} else if (allList.get(i).get("txtWidth") instanceof Double) {
							op2.setWidth((double) allList.get(i).get("txtWidth"));
						}
						if (allList.get(i).get("txtHeight") instanceof Integer) {
							op2.setHeight((int) allList.get(i).get("txtHeight"));
						} else if (allList.get(i).get("txtHeight") instanceof Double) {
							op2.setHeight((double) allList.get(i).get("txtHeight"));
						}
						if (allList.get(i).get("txtX") instanceof Integer) {
							op2.setX((int) allList.get(i).get("txtX"));
						} else if (allList.get(i).get("txtX") instanceof Double) {
							op2.setX((double) allList.get(i).get("txtX"));
						}
						if (allList.get(i).get("txtY") instanceof Integer) {
							op2.setY((int) allList.get(i).get("txtY"));
						} else if (allList.get(i).get("txtY") instanceof Double) {
							op2.setY((double) allList.get(i).get("txtY"));
						}
						op2.setTextboxNum(textboxNum);
						op2.setDiaryNum(d.getDiaryNum());
						result = os.insertTxt(op2);
					}

				}
			}
		}
		if (result == 1) {
			msg = "1";
		} else {
			msg = "0";
		}
		return msg;
	}
	
	@RequestMapping("diary/update")
	public String update() {
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
		//ok
		int result = 0;
		result = os.delete(diaryNum); //element 좌표 값 삭제
		result = ds.del(diaryNum); //diary 삭제
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

	@RequestMapping(value = "diary/decorate", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String insert(@RequestBody List<Map> allList, HttpSession session) {
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		Diary d = new Diary();
		ObjectPosition op = new ObjectPosition();
		Textbox t = new Textbox();
		int diaryNum = 0;
		System.out.println(allList);
		int result = 0;
		String msg = "";
		for (int i = 0; i < allList.size(); i++) {
			if (i == 0) {
				d.setSubject((String) allList.get(i).get("subject"));
				d.setDiaryCataNum(Integer.parseInt((String) allList.get(i).get("diaryCataNum")));
				d.setBgColor((String) allList.get(i).get("bgColor"));
				d.setMemberNum(memberNum);
				diaryNum = ds.insertSelect(d);
			} else if (i > 0) {
				if (allList.get(i).containsKey("st")) {
					op.setStickerNum((int) allList.get(i).get("stickerNum"));
					if (allList.get(i).get("stWidth") instanceof Integer) {
						op.setWidth((int) allList.get(i).get("stWidth"));
					} else if (allList.get(i).get("stWidth") instanceof Double) {
						op.setWidth((double) allList.get(i).get("stWidth"));
					}
					if (allList.get(i).get("stHeight") instanceof Integer) {
						op.setHeight((int) allList.get(i).get("stHeight"));
					} else if (allList.get(i).get("stHeight") instanceof Double) {
						op.setHeight((double) allList.get(i).get("stHeight"));
					}
					if (allList.get(i).get("stX") instanceof Integer) {
						op.setX((int) allList.get(i).get("stX"));
					} else if (allList.get(i).get("stX") instanceof Double) {
						op.setX((double) allList.get(i).get("stX"));
					}
					if (allList.get(i).get("stY") instanceof Integer) {
						op.setY((int) allList.get(i).get("stY"));
					} else if (allList.get(i).get("stY") instanceof Double) {
						op.setY((double) allList.get(i).get("stY"));
					}
					op.setDiaryNum(diaryNum);
					result = os.insert(op);
				} else if (allList.get(i).containsKey("txt")) {
					ObjectPosition op2 = new ObjectPosition();
					t.setContent((String) allList.get(i).get("content"));
					t.setFntSize((String) (allList.get(i).get("fntSize")));
					t.setFntColor((String) allList.get(i).get("fntColor"));
					t.setFntWeight(Integer.parseInt((String) allList.get(i).get("fntWeight")));
					int textboxNum = ts.insert(t);
					if (textboxNum != 0) {
						if (allList.get(i).get("txtWidth") instanceof Integer) {
							op2.setWidth((int) allList.get(i).get("txtWidth"));
						} else if (allList.get(i).get("txtWidth") instanceof Double) {
							op2.setWidth((double) allList.get(i).get("txtWidth"));
						}
						if (allList.get(i).get("txtHeight") instanceof Integer) {
							op2.setHeight((int) allList.get(i).get("txtHeight"));
						} else if (allList.get(i).get("txtHeight") instanceof Double) {
							op2.setHeight((double) allList.get(i).get("txtHeight"));
						}
						if (allList.get(i).get("txtX") instanceof Integer) {
							op2.setX((int) allList.get(i).get("txtX"));
						} else if (allList.get(i).get("txtX") instanceof Double) {
							op2.setX((double) allList.get(i).get("txtX"));
						}
						if (allList.get(i).get("txtY") instanceof Integer) {
							op2.setY((int) allList.get(i).get("txtY"));
						} else if (allList.get(i).get("txtY") instanceof Double) {
							op2.setY((double) allList.get(i).get("txtY"));
						}
						op2.setTextboxNum(textboxNum);
						op2.setDiaryNum(diaryNum);
						result = os.insertTxt(op2);
					}

				}
			}
		}
		if (result > 0) {
			msg = "1";
		} else {
			msg = "0";
		}
		return msg;
	}

	@RequestMapping("diary/allDel")
	public String allDel(int memberNum, Model model) {
		int result = 0;
		List<Integer> diaryNumList = new ArrayList<Integer>();
		diaryNumList = ds.memberSelect(memberNum);
		for (int i = 0; i < diaryNumList.size(); i++) {
			System.out.println("num="+diaryNumList.get(i));
		}
		result = os.allDel(diaryNumList);
		result = ds.allDel(memberNum); // op에서 diarynum을 사용하고 있기 때문에 다이어리부터 먼저 지울 수 없다.
		model.addAttribute("result", result);
		return "diary/del";
	}


}
