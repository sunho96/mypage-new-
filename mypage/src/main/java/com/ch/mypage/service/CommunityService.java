package com.ch.mypage.service;

import java.util.Collection;

import com.ch.mypage.model.Community;
import com.ch.mypage.model.CommunityComments;
import com.ch.mypage.model.CommunityLikey;

public interface CommunityService {

	Collection<Community> listDefault();

	Collection<Community> addList(int startNum);

	CommunityLikey selectLikey(int memberNum, int communityNum);

	int insertLikey(int memberNum, int communityNum);

	int deleteLikey(int memberNum, int communityNum);

	int likeyCnt(int communityNum);

	int insertComment(CommunityComments comment);

	Collection<CommunityComments> commentsList(int communityNum);

	Collection<CommunityLikey> isLikeyList(int memberNum);

	Collection<Community> listDefault(int memberNum);

	int sharedCount(int memberNum);

	Collection<Community> myLikeyListDefault(int memberNum);

	Community select(int communityNum);

	void deleteLikey(int communityNum);

	void deleteComments(int communityNum);

	void deleteHashAndCom(int communityNum);

	int deleteCommunity(int communityNum);


	


}
