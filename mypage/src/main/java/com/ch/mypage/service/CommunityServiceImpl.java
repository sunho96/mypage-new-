package com.ch.mypage.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.mypage.dao.CommunityDao;
import com.ch.mypage.model.Community;
import com.ch.mypage.model.CommunityComments;
import com.ch.mypage.model.CommunityLikey;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityDao cd;

	@Override
	public Collection<Community> listDefault() {
		// TODO Auto-generated method stub
		return cd.listDefault();
	}

	@Override
	public Collection<Community> addList(int startNum) {
		// TODO Auto-generated method stub
		return cd.addList(startNum);
	}

	@Override
	public CommunityLikey selectLikey(int memberNum, int communityNum) {
		// TODO Auto-generated method stub
		return cd.selectLikey(memberNum,communityNum);
	}

	@Override
	public int insertLikey(int memberNum, int communityNum) {
		// TODO Auto-generated method stub
		return cd.insertLikey(memberNum,communityNum);
	}

	@Override
	public int deleteLikey(int memberNum, int communityNum) {
		// TODO Auto-generated method stub
		return cd.deleteLikey(memberNum,communityNum);
	}

	@Override
	public int likeyCnt(int communityNum) {
		// TODO Auto-generated method stub
		return cd.likeyCnt(communityNum);
	}

	@Override
	public int insertComment(CommunityComments comment) {
		// TODO Auto-generated method stub
		return cd.insertComment(comment);
	}

	@Override
	public Collection<CommunityComments> commentsList(int communityNum) {
		// TODO Auto-generated method stub
		return cd.commentsList(communityNum);
	}

	@Override
	public Collection<CommunityLikey> isLikeyList(int memberNum) {
		// TODO Auto-generated method stub
		return cd.isLikeyList(memberNum)	;
	}

	

	
}
