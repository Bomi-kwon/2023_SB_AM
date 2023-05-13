package com.koreaIT.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Article;
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
		
		return Util.jsReplace(doJoinRd.getMsg(), "login");
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
			return Util.jsHistoryBack(Util.f("%s는 존재하지 않는 아이디입니다.",loginID));
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
	
	@RequestMapping("/usr/member/profile")
	public String showProfile(Model model) {
		
		Member member = memberService.getMemberById(rq.getLoginedMemberId());
		
		model.addAttribute("member", member);
		
		return "usr/member/profile";
	}
	
	@RequestMapping("/usr/member/checkPassword")
	public String doCheckPassword(Model model) {
		
		return "usr/member/checkPassword";
	}
	
	@RequestMapping("/usr/member/doCheckPassword")
	public String doCheckPassword(String loginPW) {
		
		if (Util.empty(loginPW)) {
			return rq.jsReturnOnView("비밀번호를 입력해주세요", true);
		}

		if (rq.getLoginedMember().getLoginPW().equals(loginPW) == false) {
			return rq.jsReturnOnView("비밀번호가 일치하지 않습니다", true);
		}
		
		return "usr/member/modifyMember";
	}
	
	@RequestMapping("/usr/member/modifyMember")
	public String modifyMember() {
		
		return "usr/member/modifyMember";
	}
	
	@RequestMapping("/usr/member/doModifyMember")
	@ResponseBody
	public String doModifyMember(String nickname, String cellphoneNum, String email) {
		
		if(Util.empty(nickname)) {
			return Util.jsHistoryBack("닉네임을 입력해주세요.");
		}
		
		if(Util.empty(cellphoneNum)) {
			return Util.jsHistoryBack("전화번호를 입력해주세요.");
		}
		
		if(Util.empty(email)) {
			return Util.jsHistoryBack("이메일을 입력해주세요.");
		}
		
		memberService.modifyMember(rq.getLoginedMemberId(), nickname, cellphoneNum, email);
		
		return Util.jsReplace(Util.f("%d번 회원의 정보를 수정하였습니다.", rq.getLoginedMemberId()), "profile");
	}
	
	@RequestMapping("/usr/member/modifyPassword")
	public String modifyPassword() {
		
		return "usr/member/modifyPassword";
	}
	
	@RequestMapping("/usr/member/doModifyPassword")
	@ResponseBody
	public String doModifyPassword(String loginPW, String loginPWCheck) {
		
		if(Util.empty(loginPW)) {
			return Util.jsHistoryBack("새 비밀번호를 입력해주세요.");
		}
		
		if(Util.empty(loginPWCheck)) {
			return Util.jsHistoryBack("새 비밀번호 확인을 입력해주세요.");
		}
		
		if(!loginPW.equals(loginPWCheck)) {
			return Util.jsHistoryBack("비밀번호가 일치하지 않습니다.");
		}
		
		memberService.doModifyPassword(rq.getLoginedMemberId(), loginPW);
		
		return Util.jsReplace(Util.f("%d번 회원의 비밀번호를 수정하였습니다.", rq.getLoginedMemberId()), "profile");
	}
	
	@RequestMapping("/usr/member/dropMember")
	@ResponseBody
	public String dropMember(int id) {
		
		Member member = memberService.getMemberById(rq.getLoginedMemberId());
		
		rq.logout();
		memberService.dropMember(id);
		
		return Util.jsReplace(Util.f("%s 회원님, 탈퇴하였습니다.", member.getName()), "/usr/home/main");
	}
	
	@RequestMapping("/usr/member/memberlist")
	public String memberlist(Model model) {
		
		if(rq.getLoginedMember().getAuthLevel() != 7) {
			Util.jsHistoryBack("회원목록은 관리자만 볼 수 있습니다.");
		}
		
		List<Member> members = memberService.getMembers();
		
		model.addAttribute("members",members);
		
		return "usr/member/memberlist";
	}
	
}
