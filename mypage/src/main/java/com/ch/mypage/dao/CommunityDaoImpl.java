package com.ch.mypage.dao;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.mypage.model.Community;
import com.ch.mypage.model.CommunityComments;
import com.ch.mypage.model.CommunityLikey;
import com.ch.mypage.model.Follow;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Community select(int communityNum) {
//		Community com = sst.selectOne("communityns.select",communityNum);
//		com.setDiary(sst.selectOne());
		return sst.selectOne("communityns.select",communityNum);
	}
	@Override
	public Collection<Community> listDefault() {
		// TODO Auto-generated method stub
		return sst.selectList("communityns.listDefault");
	}
	@Override
	public Collection<Community> listDefault(int memberNum) {
		// TODO Auto-generated method stub
		return sst.selectList("communityns.selectListDefault", memberNum);
	}
	
	
	@Override
	public Collection<Community> addList(int startNum) {
		// TODO Auto-generated method stub
		return sst.selectList("communityns.addList",startNum);
		
	}
	@Override
	public int sharedCount(int memberNum) {
		// TODO Auto-generated method stub
		return sst.selectOne("communityns.sharedCount",memberNum);
	}
	@Override
	public Collection<Community> myLikeyListDefault(int memberNum) {
		// TODO Auto-generated method stub
		return sst.selectList("communityns.myLikeyListDefault",memberNum);
	}
	@Override
	public int deleteCommunity(int communityNum) {
		// TODO Auto-generated method stub
		return sst.delete("communityns.deleteCommunity", communityNum);
	}
	
	
	
	//좋아요
	@Override
	public CommunityLikey selectLikey(int memberNum, int communityNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNum", memberNum);
		map.put("communityNum", communityNum);
		
		// TODO Auto-generated method stub
		return sst.selectOne("communityLikeyns.select", map);
	}

	@Override
	public int insertLikey(int memberNum, int communityNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNum", memberNum);
		map.put("communityNum", communityNum);
		
		// TODO Auto-generated method stub
		return sst.insert("communityLikeyns.insert", map);
	}

	@Override
	public int deleteLikey(int memberNum, int communityNum) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNum", memberNum);
		map.put("communityNum", communityNum);
		
		return sst.delete("communityLikeyns.delete",map);
	}
	@Override
	public void deleteLikey(int communityNum) {
		// TODO Auto-generated method stub
		sst.delete("communityLikeyns.deleteComm", communityNum);
	}

	@Override
	public int likeyCnt(int communityNum) {
		// TODO Auto-generated method stub
		return sst.selectOne("communityLikeyns.likeyCnt", communityNum);
	}
	@Override
	public Collection<CommunityLikey> isLikeyList(int memberNum) {
		// TODO Auto-generated method stub
		return sst.selectList("communityLikeyns.isLikeyListDefault", memberNum);
	}
	
	
	
	
	//댓글
	@Override
	public int insertComment(CommunityComments comment) {
		// TODO Auto-generated method stub
		
		System.out.println("insertComment memberNum : " + comment.getMemberNum() + ", communityNum : " + comment.getCommunityNum() + ", content : " + comment.getContent());
		return sst.insert("communityCommentsns.insertComment",comment);
	}


	@Override
	public Collection<CommunityComments> commentsList(int communityNum) {
		// TODO Auto-generated method stub
		return sst.selectList("communityCommentsns.list",communityNum);
	}
	@Override
	public void deleteComments(int communityNum) {
		// TODO Auto-generated method stub
		sst.delete("communityCommentsns.deleteComm", communityNum);
	}
	
	
	
	//해시앤커뮤니티
	@Override
	public void deleteHashAndCom(int communityNum) {
		// TODO Auto-generated method stub
		sst.delete("hashAndCommns.deleteComm", communityNum);
	}
	
	
	//팔로우
	@Override
	public Follow selectFollow(int memberNum, int target) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNum", memberNum);
		map.put("target", target);
		return sst.selectOne("followns.selectFollowing", map);
	}
	@Override
	public int insertFollow(int memberNum, int target) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNum", memberNum);
		map.put("target", target);
		return sst.insert("followns.insert", map);
	}
	@Override
	public void deleteFollow(int memberNum, int target) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNum", memberNum);
		map.put("target", target);
		
		sst.delete("followns.delete", map);
	}
	@Override
	public int followingCount(int memberNum) {
		// TODO Auto-generated method stub
		return sst.selectOne("followns.followingCount", memberNum);
	}
	@Override
	public int followerCount(int memberNum) {
		// TODO Auto-generated method stub
		return sst.selectOne("followns.followerCount", memberNum);
	}
	@Override
	public Collection<Follow> followingList(int memberNum) {
		// TODO Auto-generated method stub
		return sst.selectList("followns.followingList", memberNum);
	}
	@Override
	public Collection<Follow> followerList(int memberNum) {
		// TODO Auto-generated method stub
		return sst.selectList("followns.followerList", memberNum);
	}
	@Override
	public Collection<Follow> isFollowingList(int memberNum, Collection<Follow> targetList) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNum", memberNum);
		map.put("targetList", targetList);
		return sst.selectList("followns.isFollowingList",map);
	}
	
	
	
	

	


	
}
