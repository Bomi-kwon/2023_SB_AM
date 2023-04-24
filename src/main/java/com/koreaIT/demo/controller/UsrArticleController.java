package com.koreaIT.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.ArticleService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Article;
import com.koreaIT.demo.vo.ResultData;

@Controller
public class UsrArticleController {
	private ArticleService articleService;
	
	@Autowired
	public UsrArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	//액션메서드
	@RequestMapping("/usr/article/doAdd")
	@ResponseBody
	public ResultData<Article> doAdd(HttpSession httpSession, String title, String body) {
		
		if (httpSession.getAttribute("loginedMemberId") == null) {
			return ResultData.from("F-0", "로그인 후 이용해주세요.");
		}
		
		if(Util.empty(title)) {
			return ResultData.from("F-1", "제목을 입력해주세요.");
		}
		
		if(Util.empty(body)) {
			return ResultData.from("F-2", "내용을 입력해주세요.");
		}
		
		int memberId = (int) httpSession.getAttribute("loginedMemberId");
		
		articleService.writeArticle(title, body, memberId);
		
		int id = articleService.getLastInsertId();
		
		Article article = articleService.getArticleById(id);
		
		return ResultData.from("S-1", Util.f("%d번 게시물이 생성되었습니다.", id), "article" ,article);
	}
	
	@RequestMapping("/usr/article/list")
	public String showList(Model model) {
		
		List<Article> articles = articleService.getArticles();
		
		model.addAttribute("articles", articles);
		
		return "usr/article/list";
	}
	
	@RequestMapping("/usr/article/detail")
	public String showDetail(int id, Model model, HttpSession httpSession) {
		int loginedMemberId = 0;
		
		if(httpSession.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) httpSession.getAttribute("loginedMemberId");
		}
		
		Article article = articleService.getForPrintArticle(loginedMemberId, id);
		
		model.addAttribute("article", article);
		model.addAttribute("loginedMemberId", loginedMemberId);
		
		return "usr/article/detail";
	}
	
	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public ResultData doDelete(HttpSession httpSession, int id) {
		
		if (httpSession.getAttribute("loginedMemberId") == null) {
			return ResultData.from("F-0", "로그인 후 이용해주세요.");
		}
		
		Article article = articleService.getArticleById(id);
		
		if(article == null) {
			return ResultData.from("F-1", Util.f("%d번 게시물은 존재하지 않습니다.", id));
		}
		
		int loginedMemberId = (int) httpSession.getAttribute("loginedMemberId");
		
		if (loginedMemberId != article.getMemberId()) {
			return ResultData.from("F-2", "게시물 삭제 권한이 없습니다.");
		}
		
		articleService.deleteArticle(id);
		
		return ResultData.from("S-1", Util.f("%d번 게시물을 삭제했습니다.", id));
	}

	@RequestMapping("/usr/article/modify")
	@ResponseBody
	public String doModify(HttpSession httpSession, int id, String title, String body, Model model) {
		
		Article article = articleService.getArticleById(id);
		
		model.addAttribute("article", article);
		
		int loginedMemberId = (int) httpSession.getAttribute("loginedMemberId");
		
		ResultData doModifyRd = articleService.doModifyRd(loginedMemberId, article.getMemberId());
		
		if(doModifyRd.isFail()) {
			return doModifyRd.getMsg();
		}
		
		model.addAttribute("httpSession", httpSession);
		model.addAttribute("loginedMemberId", loginedMemberId);
		model.addAttribute("title", title);
		model.addAttribute("body", body);
		
//		return articleService.modifyArticle(id, title, body);
		return "usr/article/modify";
	}

}
