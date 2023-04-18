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
		
		existsMember = getMemberByNickname(nickname);
		
		if (existsMember != null) {
			return -2;
		}
		
		existsMember = getoctopusMember(name, email);
		
		if (existsMember != null) {
			return -3;
		}
		
		memberRepository.doJoin(loginID, loginPW, name, nickname, cellphoneNum, email);
		
		return memberRepository.getLastInsertId();
	}

	private Member getoctopusMember(String name, String email) {
		return memberRepository.getoctopusMember(name, email);
	}

	private Member getMemberByNickname(String nickname) {
		return memberRepository.getMemberByNickname(nickname);
	}

	private Member getMemberByLoginID(String loginID) {
		return memberRepository.getMemberByLoginID(loginID);
	}

	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}
	
}
