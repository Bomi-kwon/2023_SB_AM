package com.koreaIT.demo.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberRepository {

	public void addMember(String loginID, String loginPW, String name, String nickname, String cellphoneNum,
			String email);

}
