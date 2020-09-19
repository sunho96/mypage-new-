package com.ch.mypage.controller;

import java.io.Console;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.mypage.model.Community;
import com.ch.mypage.model.CommunityComments;
import com.ch.mypage.model.CommunityLikey;
import com.ch.mypage.model.Diary;
import com.ch.mypage.model.Member;
import com.ch.mypage.model.ObjectPosition;
import com.ch.mypage.model.Sticker;
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
		// 테스트용 세션
		int memberNum;
		if(session.getAttribute("memberNum") == null) {
				session.setAttribute("memberNum", "1");
				memberNum = 1;
		}else {
			memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		}
		
		return "community/home";
	}
	
	
	@RequestMapping("community/contentList")
	public String listView(@RequestParam int startNum, Model model, HttpSession session) {
		// 테스트용 세션
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		
		
		//게시물 리스트
		Collection<Community> list = cs.addList(startNum);

		// memberNum이 좋아요 한 리스트
		Collection<CommunityLikey> isLikeyList = cs.isLikeyList(memberNum);
		
		// 게시물별 댓글 리스트
		for (Community community : list) {
			community.setCommentsList(cs.commentsList(community.getCommunityNum()));
		}
		
		// list 넘기기
		model.addAttribute("list", list);
		model.addAttribute("isLikeyList", isLikeyList);
		return "community/contentList";
	}

	@RequestMapping(value = "addCoummunityList", method = RequestMethod.POST)
	@ResponseBody
	public Collection<Community> addCoummunityList(int startNum) {
		Collection<Community> list = cs.addList(startNum);

		// @ResponseBody로 리턴하면 spring에서 허용된 형식의 데이터를 반환
		// 혀용된 형식의 데이터가 아니면 json으로 반환하는듯
		return list;
	}

	@RequestMapping("communitySeek")
	public String communitySeek(Model model) {
		Collection<Community> list = cs.listDefault();
		model.addAttribute("list", list);
		return "community/seekForm";
	}

	// 좋아요버튼 클릭시
	@RequestMapping(value = "communityLikey", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> communityLikey(int communityNum, Model model, HttpSession session) {
		int result = 0;
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		Map<String, Integer> map = new HashMap<String, Integer>();

		// 좋아요 했는지 여부에 따라 추가 or 삭제함
		CommunityLikey likeyChk = cs.selectLikey(memberNum, communityNum);
		if (likeyChk == null) {
			result = cs.insertLikey(memberNum, communityNum);
		} else {
			result = -cs.deleteLikey(memberNum, communityNum);
		}

		// 좋아요개수 검색
		int likeyCnt = cs.likeyCnt(communityNum);

		map.put("result", result);
		map.put("likeyCnt", likeyCnt);
		return map;
	}

	@RequestMapping(value = "writeComment", method = RequestMethod.POST)
	@ResponseBody
	public CommunityComments writeComment(CommunityComments comment, HttpSession session, Model model) {
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		comment.setMemberNum(memberNum);
		int result = cs.insertComment(comment);

		// 닉네임 가져오기
		Member member = ms.selectMember(memberNum);
		comment.setNickName(member.getNickName());

		return comment;
	}

	@RequestMapping(value = "selectCommentList", method = RequestMethod.POST)
	@ResponseBody
	public Collection<CommunityComments> selectCommentList(int communityNum) {
		// 댓글 최신순으로 가져오기
		Collection<CommunityComments> commentList = cs.commentsList(communityNum);

		return commentList;
	}

	@RequestMapping("communityProfile")
	public String communityProfile(@RequestParam int memberNum, Model model, HttpSession session) {

		// member의 정보
		Member member = ms.selectMember(memberNum);
		int sharedCount = cs.sharedCount(memberNum); // 공유한 게시물수

		model.addAttribute("member", member);
		model.addAttribute("sharedCount", sharedCount);

		return "community/profile";

	}

	@RequestMapping("community/iSharedContents")
	public String iSharedContents(int memberNum, Model model) {

		// 작성한 게시글 리스트
		Collection<Community> commList = cs.listDefault(memberNum);

		// 게시물별 댓글 리스트
		for (Community community : commList) {
			community.setCommentsList(cs.commentsList(community.getCommunityNum()));
		}

		// memberNum이 좋아요 한 리스트
		Collection<CommunityLikey> isLikeyList = cs.isLikeyList(memberNum);

		model.addAttribute("commList", commList);
		model.addAttribute("isLikeyList", isLikeyList);
		return "community/iSharedContents";
	}
	
	@RequestMapping("community/iLikeyContents")
	public String iLikeyContents(int memberNum, Model model) {
		
		// 작성한 게시글 리스트
		Collection<Community> commList = cs.myLikeyListDefault(memberNum);
		
		// 게시물별 댓글 리스트
		for (Community community : commList) {
			community.setCommentsList(cs.commentsList(community.getCommunityNum()));
		}
		
		// memberNum이 좋아요 한 리스트
		Collection<CommunityLikey> isLikeyList = cs.isLikeyList(memberNum);
		
		model.addAttribute("commList", commList);
		model.addAttribute("isLikeyList", isLikeyList);
		return "community/iLikeyContents";
	}
	
	@RequestMapping(value="community/sharedCancel")
	@ResponseBody
	public int sharedCancel(int communityNum,HttpSession session){
		int memberNum = Integer.parseInt(session.getAttribute("memberNum").toString());
		Community community = cs.select(communityNum);
		int result = 0;
		
		System.out.println("community : " + community);
		if(memberNum == community.getDiary().getMemberNum()) {
			System.out.println("member 값이 동일하다");
			//커뮤니티를 참조하는 데이터들 삭제
			cs.deleteLikey(communityNum);
			cs.deleteComments(communityNum);
			cs.deleteHashAndCom(communityNum);
			
			//커뮤니티 데이터 삭제
			result = cs.deleteCommunity(communityNum);
			
		}
		
		return result;
	}
	
	
	/* 테스트 */
	@RequestMapping(value="community/testView")
	public String testView(Model model) {
		
		return "community/testCommunity";
	}
	
	

	@ResponseBody
	@RequestMapping(value ="community/ImgSaveTest", method = RequestMethod.POST)
	public ModelMap ImgSaveTest(@RequestParam HashMap<Object, Object> param, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		ModelMap map = new ModelMap();
		String binaryData = request.getParameter("imgSrc");
		int diaryNum = Integer.parseInt(request.getParameter("diaryNum"));
		FileOutputStream stream = null;
		
		try{
			System.out.println("binary file   "  + binaryData);
			if(binaryData == null || binaryData.trim().equals("")) {
			    throw new Exception();
			}
			binaryData = binaryData.replaceAll("data:image/png;base64,", "");
			byte[] file = Base64.decodeBase64(binaryData);
			
			//String fileName=  UUID.randomUUID().toString();	//유일한 이름 생성 후 저장
			String fileName=  "diaryContent"+diaryNum;
			String path = request.getSession().getServletContext().getRealPath("images/diary/contents/");
			
			stream = new FileOutputStream(path+fileName+".png");
			stream.write(file);
			stream.close();
			System.out.println("캡처 저장"+", ㅋㅋㅋㅋㅋㅋ path :  " + path);
		    
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("에러 발생");
		}finally{
			if(stream != null) {
				stream.close();
			}
		}
		
		map.addAttribute("resultMap", "");
		return map;
	}
}
