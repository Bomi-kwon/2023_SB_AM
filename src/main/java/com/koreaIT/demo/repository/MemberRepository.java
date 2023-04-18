package com.koreaIT.demo.repository;

import org.apache.ibatis.annotations.Mapper;

import com.koreaIT.demo.vo.Member;

@Mapper
public interface MemberRepository {

	public void doJoin(String loginID, String loginPW, String name, String nickname, String cellphoneNum,
			String email);

	public int getLastInsertId();

	public Member getMemberById(int id);

	public Member getMemberByLoginID(String loginID);

}
