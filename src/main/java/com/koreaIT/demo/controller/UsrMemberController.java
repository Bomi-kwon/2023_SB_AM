package com.koreaIT.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.ResultData;
import com.koreaIT.demo.vo.Rq;

@Controller
public class UsrMemberController {
	private MemberService memberService;
	private Rq rq;
	
	@Autowired
	public UsrMemberController(MemberService memberService, Rq rq) {
		this.memberService = memberService;
		this.rq = rq;
	}
	
	//액션메서드
	@RequestMapping("/usr/member/join")
	public String join() {
		return "usr/member/join";
	}
	
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(String loginID, String loginPW, String name, String nickname, String cellphoneNum, String email) {
		
		if ( rq.getLoginedMemberId() != 0) {
			return Util.jsHistoryBack("로그아웃 후 이용해주세요.");
		}
		
		if(Util.empty(loginID)) {
			return Util.jsHistoryBack("아이디를 입력해주세요.");
		}
		
		if(Util.empty(loginPW)) {
			return Util.jsHistoryBack("비밀번호를 입력해주세요.");
		}
		
		if(Util.empty(name)) {
			return Util.jsHistoryBack("이름을 입력해주세요.");
		}
		
		if(Util.empty(nickname)) {
			return Util.jsHistoryBack("닉네임을 입력해주세요.");
		}
		
		if(Util.empty(cellphoneNum)) {
			return Util.jsHistoryBack("전화번호를 입력해주세요.");
		}
		
		if(Util.empty(email)) {
			return Util.jsHistoryBack("이메일을 입력해주세요.");
		}
		
		ResultData<Integer> doJoinRd = memberService.doJoin(loginID, loginPW, name, nickname, cellphoneNum, email);
		
		if(doJoinRd.isFail()) {
			return Util.jsHistoryBack(doJoinRd.getMsg());
		}
		
		return Util.jsReplace(doJoinRd.getMsg(), "/");
	}
	
	@RequestMapping("/usr/member/login")
	public String login() {
		return "usr/member/login";
	}
	
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(String loginID, String loginPW) {
		
		if ( rq.getLoginedMemberId() != 0) {
			return Util.jsHistoryBack("로그아웃 후 이용해주세요.");
		}
		
		if(Util.empty(loginID)) {
			return Util.jsHistoryBack("아이디를 입력해주세요.");
		}
		
		if(Util.empty(loginPW)) {
			return Util.jsHistoryBack("비밀번호를 입력해주세요.");
		}
		
		Member member = memberService.getMemberByLoginID(loginID);
		
		if (member == null) {
			return Util.jsHistoryBack(Util.f("%s는 존재하지 않는 아이디입니다."));
		}
		
		if (!member.getLoginPW().equals(loginPW)) {
			return Util.jsHistoryBack("비밀번호가 일치하지 않습니다.");
		}
		
		rq.login(member);
		
		return Util.jsReplace(Util.f("%s님 로그인을 성공했습니다. 환영합니다~!", member.getNickname()), "/");
	}
	
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogout() {
		
		if ( rq.getLoginedMemberId() == 0) {
			return Util.jsHistoryBack("로그인 후 이용해주세요.");
		}
		
		rq.logout();
		
		return Util.jsReplace("로그아웃 되었습니다.", "/");
	}
	
	
}
