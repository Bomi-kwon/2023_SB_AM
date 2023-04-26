package com.koreaIT.demo.controller;

import javax.servlet.http.HttpServletRequest;
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
	@RequestMapping("/usr/member/join")
	public String join(HttpSession httpSession, String loginID, String loginPW) {
		return "usr/member/join";
	}
	
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public ResultData<Member> doJoin(HttpSession httpSession, HttpServletRequest req,String loginID, String loginPW, String name, String nickname, String cellphoneNum, String email) {
		
//		if (httpSession.getAttribute("loginedMemberId") != null) {
//			return ResultData.from("F-0", "로그아웃 후 이용해주세요.");
//		}
		
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
		
		return ResultData.from(doJoinRd.getResultCode(), doJoinRd.getMsg(), "member" ,member);
	}
	
	@RequestMapping("/usr/member/login")
	public String login() {
		return "usr/member/login";
	}
	
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(HttpSession httpSession, String loginID, String loginPW) {
		
		if (httpSession.getAttribute("loginedMemberId") != null) {
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
		
		httpSession.setAttribute("loginedMemberId", member.getId());
		
		return Util.jsReplace(Util.f("%s님 로그인을 성공했습니다. 환영합니다~!", member.getNickname()), "/");
	}
	
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogout(HttpSession httpSession, HttpServletRequest req) {
		
//		if (rq.getLoginedMemberId() == 0) {
//			return ResultData.from("F-1", "로그인 후 이용해주세요.");
//		}
		
		httpSession.removeAttribute("loginedMemberId");
		
		return Util.jsReplace("로그아웃 되었습니다.", "/usr/home/main");
	}
	
	
}
