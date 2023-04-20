package com.koreaIT.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.ResultData;

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
	public ResultData<Member> doJoin(HttpSession httpSession, String loginID, String loginPW, String name, String nickname, String cellphoneNum, String email) {
		
		if (httpSession.getAttribute("loginedMemberId") != null) {
			return ResultData.from("F-0", "로그아웃 후 이용해주세요.");
		}
		
		if(Util.empty(loginID)) {
			return ResultData.from("F-1", "아이디를 입력해주세요.");
		}
		
		if(Util.empty(loginPW)) {
			return ResultData.from("F-2", "비밀번호를 입력해주세요.");
		}
		
		if(Util.empty(name)) {
			return ResultData.from("F-3", "이름을 입력해주세요.");
		}
		
		if(Util.empty(nickname)) {
			return ResultData.from("F-4", "닉네임을 입력해주세요.");
		}
		
		if(Util.empty(cellphoneNum)) {
			return ResultData.from("F-5", "전화번호를 입력해주세요.");
		}
		
		if(Util.empty(email)) {
			return ResultData.from("F-6", "이메일을 입력해주세요.");
		}
		
		ResultData<Integer> doJoinRd = memberService.doJoin(loginID, loginPW, name, nickname, cellphoneNum, email);
		
		if(doJoinRd.isFail()) {
			return ResultData.from(doJoinRd.getResultCode(), doJoinRd.getMsg());
		}
		
		int id = (int) doJoinRd.getData1();
		Member member = memberService.getMemberById(id);
		
		return ResultData.from(doJoinRd.getResultCode(), doJoinRd.getMsg(), member);
	}
	
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public ResultData doLogin(HttpSession httpSession, String loginID, String loginPW) {
		 
		if (httpSession.getAttribute("loginedMemberId") != null) {
			return ResultData.from("F-1", "로그아웃 후 이용해주세요.");
		}
		
		if(Util.empty(loginID)) {
			return ResultData.from("F-2", "아이디를 입력해주세요.");
		}
		
		if(Util.empty(loginPW)) {
			return ResultData.from("F-3", "비밀번호를 입력해주세요.");
		}
		
		Member member = memberService.getMemberByLoginID(loginID);
		
		if (member == null) {
			return ResultData.from("F-4", Util.f("%s는 존재하지 않는 아이디입니다.", loginID));
		}
		
		if (!member.getLoginPW().equals(loginPW)) {
			return ResultData.from("F-5", "비밀번호가 일치하지 않습니다.");
		}
		
		httpSession.setAttribute("loginedMemberId", member.getId());
		
		return ResultData.from("S-1", Util.f("%s님 로그인을 성공했습니다. 환영합니다~!", member.getNickname()));
	}
	
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public ResultData doLogout(HttpSession httpSession) {
		 
		if (httpSession.getAttribute("loginedMemberId") == null) {
			return ResultData.from("F-1", "로그인 후 이용해주세요.");
		}
		
		httpSession.removeAttribute("loginedMemberId");
		
		return ResultData.from("S-1", "로그아웃 되었습니다.");
	}
	
	
}
