package com.ch.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.mypage.dao.DiaryCataDao;
import com.ch.mypage.model.DiaryCatagory;
import com.ch.mypage.model.MemAndCata;

@Service
public class DiaryCataServiceImpl implements DiaryCataService {
	
	@Autowired
	private DiaryCataDao dcd;
	
	@Override
	public List<MemAndCata> cataList(int memberNum) {
	
		return dcd.cataList(memberNum);
	}
	
	@Override
	public int insertCata(String name) {
		
		return dcd.insertCata(name);
	}
	@Override
	public int cataDel(int diaryCataNum, int memberNum) {
		
		return dcd.cataDel(diaryCataNum,memberNum);
	}

	@Override
	public int insertMemAndCata(int memberNum, int diaryCataNum) {
		
		return dcd.insertMemAndCata(memberNum,diaryCataNum);
	}

	@Override
	public int memAnaCataDel(int memberNum, int diaryCataNum) {
		return dcd.memAnaCataDel(memberNum,diaryCataNum);
		
	}

	@Override
	public DiaryCatagory selectCata(String name) {
		
		return dcd.selectCata(name);
	}

	@Override
	public MemAndCata selectMemAndCata(int diaryCataNum, int memberNum) {
		
		return dcd.selectMemAndCata(diaryCataNum,memberNum);
	}

	@Override
	public int memAndCataAllDel(int memberNum) {
		
		return dcd.memAndCataAllDel(memberNum);
	}

	
}
