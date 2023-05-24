package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreaIT.demo.vo.Member;

@Mapper
public interface MemberRepository {

	public void doJoin(String loginID, String loginPW, String name, String nickname, String cellphoneNum, String email);

	public int getLastInsertId();

	public Member getMemberById(int id);

	public Member getMemberByLoginID(String loginID);

	public Member getMemberByNickname(String nickname);

	public Member getoctopusMember(String name, String email);

	public void modifyMember(int id, String nickname, String cellphoneNum, String email);

	public void dropMember(int id);

	public List<Member> getMembers();

	public void doModifyPassword(int loginedMemberId, String loginPW);

}
