package com.ch.mypage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.mypage.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sst;
	

	@Override
	public Member select(String email) {
		
		return sst.selectOne("memberns.select",email);
	}

	@Override
	public Member selectMember(int memberNum) {
		
		return sst.selectOne("memberns.selectMember",memberNum);
	}
	
	@Override
	public int insert(Member member) {
		return sst.insert("memberns.insert",member);
	}

	@Override
	public int update(Member member) {
		// TODO Auto-generated method stub
		return sst.update("memberns.update", member);
	}
}
