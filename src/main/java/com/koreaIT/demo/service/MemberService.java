package com.koreaIT.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.MemberRepository;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.ResultData;

@Service
public class MemberService {
	
	@Value("${custom.siteName}")
	private String siteName;
	@Value("${custom.siteMainUri}")
	private String siteMainUri;
	
	private MemberRepository memberRepository;
	private MailService mailService;
	
	@Autowired
	public MemberService(MemberRepository memberRepository, MailService mailService) {
		this.memberRepository = memberRepository;
		this.mailService = mailService;
	}

	public ResultData<Integer> doJoin(String loginID, String loginPW, String name, String nickname, String cellphoneNum, String email) {
		
		Member existsMember = getMemberByLoginID(loginID);
		
		if (existsMember != null) {
			return ResultData.from("F-7", Util.f("%s는 이미 사용중인 아이디입니다.", loginID));
		}
		
		existsMember = getMemberByNickname(nickname);
		
		if (existsMember != null) {
			return ResultData.from("F-8", Util.f("%s는 이미 사용중인 닉네임입니다.", nickname));
		}
		
		existsMember = getoctopusMember(name, email);
		
		if (existsMember != null) {
			return ResultData.from("F-9", Util.f("이미 사용중인 이름(%s)과 이메일(%s)입니다. 회원가입은 회원당 한 번씩만 가능합니다.", name, email));
		}
		
		memberRepository.doJoin(loginID, loginPW, name, nickname, cellphoneNum, email);
		
		int id = memberRepository.getLastInsertId();
		
		return ResultData.from("S-1", Util.f("%s님, 회원가입을 축하합니다.", nickname), "id" ,id);
	}

	public Member getoctopusMember(String name, String email) {
		return memberRepository.getoctopusMember(name, email);
	}

	private Member getMemberByNickname(String nickname) {
		return memberRepository.getMemberByNickname(nickname);
	}

	public Member getMemberByLoginID(String loginID) {
		return memberRepository.getMemberByLoginID(loginID);
	}

	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}

	public void modifyMember(int id, String nickname, String cellphoneNum, String email) {
		memberRepository.modifyMember(id, nickname, cellphoneNum, email);
	}

	public void dropMember(int id) {
		memberRepository.dropMember(id);
	}

	public List<Member> getMembers() {
		return memberRepository.getMembers();
	}

	public void doModifyPassword(int loginedMemberId, String loginPW) {
		memberRepository.doModifyPassword(loginedMemberId, loginPW);
	}

	public ResultData notifyTempLoginPwByEmail(Member member) {

		String title = "[" + siteName + "] 임시 패스워드 발송";
		String tempPassword = Util.getTempPassword(8);
		String body = "<h1>임시 패스워드 : " + tempPassword + "</h1>";
		body += "<a style='font-size:4rem;' href=\"" + siteMainUri + "/usr/member/login\" target=\"_blank\">로그인 하러가기</a>";

		ResultData sendRd = mailService.send(member.getEmail(), title, body);

		if (sendRd.isFail()) {
			return sendRd;
		}

		setTempPassword(member, tempPassword);

		return ResultData.from("S-1", "계정의 이메일주소로 임시 패스워드가 발송되었습니다");
	}

	private void setTempPassword(Member member, String tempPassword) {
		memberRepository.doModifyPassword(member.getId(), Util.sha256(tempPassword));
	}

	
}
