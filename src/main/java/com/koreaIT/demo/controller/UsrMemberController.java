package com.koreaIT.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.MemberService;

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
	public Object doJoin(String loginID, String loginPW, String name, String nickname, String cellphoneNum, String email) {
		
		if(loginID == null || loginID.trim().length() == 0) {
			return "아이디를 입력하세요.";
		}
		
		if(loginPW == null || loginPW.trim().length() == 0) {
			return "비밀번호를 입력하세요.";
		}
		
		if(name == null || name.trim().length() == 0) {
			return "이름을 입력하세요.";
		}
		
		if(nickname == null || nickname.trim().length() == 0) {
			return "닉네임을 입력하세요.";
		}
		
		if(cellphoneNum == null || cellphoneNum.trim().length() == 0) {
			return "전화번호를 입력하세요.";
		}
		
		if(email == null || email.trim().length() == 0) {
			return "이메일을 입력하세요.";
		}
		
		int id = memberService.doJoin(loginID, loginPW, name, nickname, cellphoneNum, email);
		
		if(id == -1) {
			return "이미 사용중인 아이디입니다.";
		}
		
		return memberService.getMemberById(id);
	}
	
	
}
