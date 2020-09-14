package com.ch.mypage.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.mypage.model.DiaryCatagory;
import com.ch.mypage.model.MemAndCata;

@Repository
public class DiaryCataDaoImpl implements DiaryCataDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public List<MemAndCata> cataList(int memberNum) {
		
		return sst.selectList("memAndCatans.cataList",memberNum);
	}
	

	@Override
	public int insertCata(String name) {
		
		return sst.insert("diaryCatans.insertCata",name);
	}
	
	@Override
	public int cataDel(int diaryCataNum, int memberNum) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("diaryCataNum", diaryCataNum);
		hm.put("memberNum", memberNum);
		return sst.update("diaryCatans.cataDel",hm);
	}

	@Override
	public int insertMemAndCata(int memberNum, int diaryCataNum) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("memberNum", memberNum);
		hm.put("diaryCataNum", diaryCataNum);
		return sst.insert("memAndCatans.insertMemAndCata",hm);
	}

	@Override
	public int memAnaCataDel(int memberNum, int diaryCataNum) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("memberNum", memberNum);
		hm.put("diaryCataNum", diaryCataNum);
		return sst.delete("memAndCatans.memAnaCataDel",hm);
	}


	@Override
	public DiaryCatagory selectCata(String name) {
		
		return sst.selectOne("diaryCatans.selectCata",name);
	}


	@Override
	public MemAndCata selectMemAndCata(int diaryCataNum, int memberNum) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("diaryCataNum", diaryCataNum);
		hm.put("memberNum", memberNum);
		return sst.selectOne("memAndCatans.selectMemAndCata",hm);
	}


	@Override
	public int memAndCataAllDel(int memberNum) {
		
		return sst.delete("memAndCatans.memAndCataAllDel",memberNum);
	}

	
	
}
