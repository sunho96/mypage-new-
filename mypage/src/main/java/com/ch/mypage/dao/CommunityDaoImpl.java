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

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Collection<Community> listDefault() {
		// TODO Auto-generated method stub
		return sst.selectList("communityns.listDefault");
	}

	@Override
	public Collection<Community> addList(int startNum) {
		// TODO Auto-generated method stub
		System.out.println("startNum = " + startNum);
		return sst.selectList("communityns.addList",startNum);
		
	}

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
	public int likeyCnt(int communityNum) {
		// TODO Auto-generated method stub
		return sst.selectOne("communityLikeyns.likeyCnt", communityNum);
	}

	@Override
	public int insertComment(int memberNum,int communityNum, String text) {
		// TODO Auto-generated method stub
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("memberNum", memberNum);
		map.put("communityNum", communityNum);
		map.put("content", text);
		System.out.println("insertComment memberNum : " + memberNum + ", communityNum : " + communityNum + ", content : " + text);
		return sst.insert("communityCommentsns.insert",map);
	}

	@Override
	public Collection<CommunityComments> commentsList(int communityNum) {
		// TODO Auto-generated method stub
		return sst.selectList("communityCommentsns.list",communityNum);
	}

	
}