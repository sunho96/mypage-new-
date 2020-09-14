package com.ch.mypage.dao;

import com.ch.mypage.model.Member;

public interface MemberDao {
	
	Member select(String email);

	Member selectMember(int memberNum);

	int insert(Member member);

	int update(Member member);

}
