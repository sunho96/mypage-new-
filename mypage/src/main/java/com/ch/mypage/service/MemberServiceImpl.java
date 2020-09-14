package com.ch.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.mypage.dao.MemberDao;
import com.ch.mypage.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao md;

	
	@Override
	public Member select(String email) {
		
		return md.select(email);
	}

	@Override
	public Member selectMember(int memberNum) {
		
		return md.selectMember(memberNum);
	}
	
	@Override
	public int insert(Member member) {
		// TODO Auto-generated method stub
		return md.insert(member);
	}

	@Override
	public int update(Member member) {
		// TODO Auto-generated method stub
		return md.update(member);
	}
	
	
}
