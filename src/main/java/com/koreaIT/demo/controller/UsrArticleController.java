package com.koreaIT.demo.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.ArticleService;
import com.koreaIT.demo.service.BoardService;
import com.koreaIT.demo.service.ReplyService;
import com.koreaIT.demo.social.PrincipalDetails;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Article;
import com.koreaIT.demo.vo.Board;
import com.koreaIT.demo.vo.Reply;
import com.koreaIT.demo.vo.ResultData;
import com.koreaIT.demo.vo.Rq;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UsrArticleController {
	private ArticleService articleService;
	private BoardService boardService;
	private ReplyService replyService;
	private Rq rq;
	
	@Autowired
	public UsrArticleController(ArticleService articleService, BoardService boardService, ReplyService replyService,Rq rq) {
		this.articleService = articleService;
		this.boardService = boardService;
		this.replyService = replyService;
		this.rq = rq;
	}
	
	//액션메서드
	@RequestMapping("/usr/article/write")
	public String write(int boardId, Model model) {
		Board board = boardService.getBoardById(boardId);
		model.addAttribute("board", board);
		return "usr/article/write";
	}
	
	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public String doWrite(String title, String body, int boardId) {
		
		if(Util.empty(title)) {
			return Util.jsHistoryBack("제목을 입력해주세요.");
		}
		
		if(Util.empty(body)) {
			return Util.jsHistoryBack("내용을 입력해주세요.");
		}
		
		articleService.writeArticle(title, body, rq.getLoginedMemberId(), boardId);
		
		int id = articleService.getLastInsertId();
		
		return Util.jsReplace(Util.f("%d번 게시물이 생성되었습니다.", id), Util.f("detail?id=%d", id));
	}
	
	@RequestMapping("/usr/article/list")
	public String showList(Model model, @RequestParam(defaultValue = "2") int boardId, 
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "title") String keyWordType, 
			@RequestParam(defaultValue = "") String keyWord, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		
		// principalDetails 가 null 이 아니라면 로그인 된 상태!!
		if(principalDetails != null ) {
			// 세션에서 로그인 유저 정보를 가져옴
			model.addAttribute("member",principalDetails.getMember());
			
		}
		
		if(page <= 0) {
			return rq.jsReturnOnView("페이지번호가 올바르지 않습니다.", true);
		}
		
		Board board = boardService.getBoardById(boardId);
		
		if(board == null) {
			return rq.jsReturnOnView("존재하지 않는 게시판입니다.", true);
		}
		
		int numberofarticles = articleService.getNumberOfArticles(boardId, keyWordType, keyWord);
		int itemsInAPage = 10;
		int pagesCount = (int) Math.ceil(numberofarticles / (double) itemsInAPage);
		
		List<Article> articles = articleService.getArticles(boardId, itemsInAPage, page, keyWordType, keyWord);
		
		log.trace("trace test");
		log.debug("debug test");
		log.info("info test");
		log.warn("warn test");
		log.error("error test");
		
		System.out.println("안녕하세용");
		
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("page", page);
		model.addAttribute("numberofarticles", numberofarticles);
		model.addAttribute("articles", articles);
		model.addAttribute("board", board);
		model.addAttribute("keyWordType", keyWordType);
		model.addAttribute("keyWord", keyWord);
		
		return "usr/article/list";
	}
	
	@RequestMapping("/usr/article/detail")
	public String showDetail(HttpServletRequest req, HttpServletResponse resp, int id, Model model) {
		
		Cookie oldCookie = null;
		Cookie[] cookies = req.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("hitCount")) {
					oldCookie = cookie;
				}
			}
		}
		
		if (oldCookie != null) {
			if (!oldCookie.getValue().contains("[" + id + "]")) {
				articleService.increaseHit(id);
				oldCookie.setValue(oldCookie.getValue() + "_[" + id + "]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge(10);
				resp.addCookie(oldCookie);
			}
		} else {
			articleService.increaseHit(id);
			Cookie newCookie = new Cookie("hitCount", "[" + id + "]");
			newCookie.setPath("/");
			newCookie.setMaxAge(10);
			resp.addCookie(newCookie);
		}
		
		Article article = articleService.getForPrintArticle(id);
		
		articleService.actorCanChangeData(rq.getLoginedMemberId(), article);
		
		List<Reply> replies = replyService.getReplies("article", id);
		
		model.addAttribute("article", article);
		model.addAttribute("replies", replies);
		
		return "usr/article/detail";
	}
	
	
	@RequestMapping("/usr/article/modify")
	public String modify(int id, Model model) {
		
		Article article = articleService.getForPrintArticle(id);
		
		ResultData actorCanMD = articleService.actorCanMD(rq.getLoginedMemberId(), article);
		
		if(actorCanMD.isFail()) {
			return rq.jsReturnOnView(actorCanMD.getMsg(), true);
		}
		
		model.addAttribute("article", article);
		
		return "usr/article/modify";
	}
	
	
	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(int id, String title, String body) {
		
		Article article = articleService.getArticleById(id);
		
		ResultData actorCanModifyRd = articleService.actorCanMD(rq.getLoginedMemberId(), article);
		
		if(actorCanModifyRd.isFail()) {
			return Util.jsHistoryBack(actorCanModifyRd.getMsg());
		}
		
		articleService.modifyArticle(id, title, body);
		
		return Util.jsReplace(Util.f("%d번 게시물을 수정하였습니다.", id), Util.f("detail?id=%d", id));
	}
	
	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(int id) {
		
		Article article = articleService.getArticleById(id);
		
		int boardId = article.getBoardId();
		
		ResultData actorCanDeleteRd = articleService.actorCanMD(rq.getLoginedMemberId(), article);
		
		if(actorCanDeleteRd.isFail()) {
			return Util.jsHistoryBack(actorCanDeleteRd.getMsg());
		}
		
		articleService.deleteArticle(id);
		
		return Util.jsReplace(Util.f("%d번 게시물을 삭제했습니다.", id), Util.f("list?boardId=%d", boardId));
	}
}
