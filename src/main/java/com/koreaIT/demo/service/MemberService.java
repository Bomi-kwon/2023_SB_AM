package com.koreaIT.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.MemberRepository;
import com.koreaIT.demo.vo.Member;

@Service
public class MemberService {
	private MemberRepository memberRepository;
	
	@Autowired
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	public int doJoin(String loginID, String loginPW, String name, String nickname, String cellphoneNum, String email) {
		
		Member existsMember = getMemberByLoginID(loginID);
		
		if (existsMember != null) {
			return -1;
		}
		
		memberRepository.doJoin(loginID, loginPW, name, nickname, cellphoneNum, email);
		
		return memberRepository.getLastInsertId();
	}

	private Member getMemberByLoginID(String loginID) {
		return memberRepository.getMemberByLoginID(loginID);
	}

	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}
	
}
