package com.koreaIT.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.vo.Member;

@Controller
public class UsrMemberController {
	private MemberService memberService;
	
	@Autowired
	public UsrMemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	//액션메서드
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public Member doJoin(String loginID, String loginPW, String name, String nickname, String cellphoneNum, String email) {
		
		memberService.addMember(loginID, loginPW, name, nickname, cellphoneNum, email);
		
		int id = memberService.getLastInsertId();
		
		Member member = memberService.getMemberById(id);
		
		return member;
	}
	
	
}
