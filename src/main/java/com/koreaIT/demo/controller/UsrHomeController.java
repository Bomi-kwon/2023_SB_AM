package com.koreaIT.demo.controller;

import java.time.Duration;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.ArticleService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.service.ReactionPointService;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;

@Controller
public class UsrHomeController {
	private ArticleService articleService;
	private MemberService memberService;
	private ReactionPointService reactionPointService;
	private Rq rq;
	
	public UsrHomeController(ArticleService articleService, MemberService memberService, ReactionPointService reactionPointService, Rq rq) {
		this.articleService = articleService;
		this.memberService = memberService;
		this.reactionPointService = reactionPointService;
		this.rq = rq;
	}

	@RequestMapping("/usr/home/main")
	public String showMain(Model model) {
		
		if(rq.getLoginedMemberId() != 0) {
			Member member = memberService.getMemberById(rq.getLoginedMemberId());
			int myArticlesCnt = articleService.getMyArticlesCnt(member.getId());
			int myLikesCnt = reactionPointService.getMyLikesCnt(member.getId());
			model.addAttribute("member", member);
			model.addAttribute("myArticlesCnt", myArticlesCnt);
			model.addAttribute("myLikesCnt", myLikesCnt);
		}
		
		return "usr/home/main";
	}
	
	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
	
	@RequestMapping("/usr/home/popup")
	public String showPopup() {
		return "usr/home/popup";
	}
	
	
}
