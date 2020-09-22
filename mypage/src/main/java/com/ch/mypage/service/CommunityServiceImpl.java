package com.ch.mypage.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.mypage.dao.CommunityDao;
import com.ch.mypage.model.Community;
import com.ch.mypage.model.CommunityComments;
import com.ch.mypage.model.CommunityLikey;
import com.ch.mypage.model.Follow;

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

	//좋아요
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
	public Collection<CommunityLikey> isLikeyList(int memberNum) {
		// TODO Auto-generated method stub
		return cd.isLikeyList(memberNum)	;
	}

	//댓글
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
	public Collection<Community> listDefault(int memberNum) {
		// TODO Auto-generated method stub
		return cd.listDefault(memberNum);
	}

	@Override
	public int sharedCount(int memberNum) {
		// TODO Auto-generated method stub
		return cd.sharedCount(memberNum);
	}

	@Override
	public Collection<Community> myLikeyListDefault(int memberNum) {
		// TODO Auto-generated method stub
		return cd.myLikeyListDefault(memberNum);
	}

	@Override
	public Community select(int communityNum) {
		// TODO Auto-generated method stub
		return cd.select(communityNum);
	}

	@Override
	public void deleteLikey(int communityNum) {
		// TODO Auto-generated method stub
		cd.deleteLikey(communityNum);
	}

	@Override
	public void deleteComments(int communityNum) {
		// TODO Auto-generated method stub
		cd.deleteComments(communityNum);
	}

	@Override
	public void deleteHashAndCom(int communityNum) {
		// TODO Auto-generated method stub
		cd.deleteHashAndCom(communityNum);
	}

	@Override
	public int deleteCommunity(int communityNum) {
		// TODO Auto-generated method stub
		return cd.deleteCommunity(communityNum);
	}

	
	//팔로우
	@Override
	public Follow selectFollow(int memberNum, int target) {
		// TODO Auto-generated method stub
		return cd.selectFollow(memberNum,target);
	}

	@Override
	public int insertFollow(int memberNum, int target) {
		// TODO Auto-generated method stub
		return cd.insertFollow(memberNum,target);
	}

	@Override
	public void deleteFollow(int memberNum, int target) {
		// TODO Auto-generated method stub
		cd.deleteFollow(memberNum,target);
	}

	@Override
	public int followingCount(int memberNum) {
		// TODO Auto-generated method stub
		return cd.followingCount(memberNum);
	}

	@Override
	public int followerCount(int memberNum) {
		// TODO Auto-generated method stub
		return cd.followerCount(memberNum);
	}

	@Override
	public Collection<Follow> followingList(int memberNum) {
		// TODO Auto-generated method stub
		return cd.followingList(memberNum);
	}

	@Override
	public Collection<Follow> followerList(int memberNum) {
		// TODO Auto-generated method stub
		return cd.followerList(memberNum);
	}

	@Override
	public Collection<Follow> isFollowingList(int memberNum,Collection<Follow> targetList) {
		// TODO Auto-generated method stub
		return cd.isFollowingList(memberNum,targetList);
	}

	@Override
	public int insertCommunity(int diaryNum) {
		// TODO Auto-generated method stub
		return cd.insertCommunity(diaryNum);
	}


	

	
}
