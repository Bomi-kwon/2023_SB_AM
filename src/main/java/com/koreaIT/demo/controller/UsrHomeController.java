package com.koreaIT.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreaIT.demo.service.ArticleService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;

@Controller
public class UsrHomeController {
	private ArticleService articleService;
	private MemberService memberService;
	private Rq rq;
	
	public UsrHomeController(ArticleService articleService, MemberService memberService, Rq rq) {
		this.articleService = articleService;
		this.memberService = memberService;
		this.rq = rq;
	}

	@RequestMapping("/usr/home/main")
	public String showMain(Model model) {
		
		if(rq.getLoginedMemberId() != 0) {
			Member member = memberService.getMemberById(rq.getLoginedMemberId());
			int myArticlesCnt = articleService.getMyArticlesCnt(member.getId());
			model.addAttribute("member", member);
			model.addAttribute("myArticlesCnt", myArticlesCnt);
		}
		
		return "usr/home/main";
	}
	
	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
	
}
