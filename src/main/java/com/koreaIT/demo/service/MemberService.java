package com.koreaIT.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.MemberRepository;

@Service
public class MemberService {
	private MemberRepository memberRepository;
	
	@Autowired
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	public void addMember(String loginID, String loginPW, String name, String nickname, String cellphoneNum,
			String email) {
		memberRepository.addMember(loginID, loginPW, name, nickname, cellphoneNum, email);
	}
	
}