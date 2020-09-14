package com.ch.mypage.dao;

import java.util.Collection;

import com.ch.mypage.model.Community;
import com.ch.mypage.model.CommunityComments;
import com.ch.mypage.model.CommunityLikey;

public interface CommunityDao {

	Collection<Community> listDefault();

	Collection<Community> addList(int startNum);

	CommunityLikey selectLikey(int memberNum, int communityNum);

	int insertLikey(int memberNum, int communityNum);

	int deleteLikey(int memberNum, int communityNum);

	int likeyCnt(int communityNum);

	int insertComment(int memberNum,int communityNum , String text);

	Collection<CommunityComments> commentsList(int communityNum);


	
}
