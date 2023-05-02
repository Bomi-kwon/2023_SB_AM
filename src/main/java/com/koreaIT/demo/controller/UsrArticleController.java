package com.koreaIT.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.ArticleService;
import com.koreaIT.demo.service.BoardService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Article;
import com.koreaIT.demo.vo.Board;
import com.koreaIT.demo.vo.ResultData;
import com.koreaIT.demo.vo.Rq;

@Controller
public class UsrArticleController {
	private ArticleService articleService;
	private BoardService boardService;
	private Rq rq;
	
	@Autowired
	public UsrArticleController(ArticleService articleService, BoardService boardService, Rq rq) {
		this.articleService = articleService;
		this.boardService = boardService;
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
			@RequestParam(defaultValue = "") String keyWord) {
		
		if(keyWordType!="title" && keyWordType!="body" && keyWordType!="all") {
			keyWordType = "title";
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
	public String showDetail(int id, Model model) {
		
		Article article = articleService.getForPrintArticle(id);
		
		articleService.actorCanChangeData(rq.getLoginedMemberId(), article);
		
		model.addAttribute("article", article);
		
		return "usr/article/detail";
	}
	
	@RequestMapping("/usr/article/doIncreaseHit")
	@ResponseBody
	public ResultData<Integer> doIncreaseHit(int id) {
		
		ResultData<Integer> increaseHitRd = articleService.increaseHit(id);
		
		if(increaseHitRd.isFail()) {
			return increaseHitRd;
		}
		
		int hit = articleService.getArticleHit(id);
		
		ResultData<Integer> rd = ResultData.from(increaseHitRd.getResultCode(), increaseHitRd.getMsg(), "hit", hit);
		
		rd.setData2("id", id);
		
		return rd;
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
		
		ResultData actorCanDeleteRd = articleService.actorCanMD(rq.getLoginedMemberId(), article);
		
		if(actorCanDeleteRd.isFail()) {
			return Util.jsHistoryBack(actorCanDeleteRd.getMsg());
		}
		
		articleService.deleteArticle(id);
		
		return Util.jsReplace(Util.f("%d번 게시물을 삭제했습니다.", id), "list?boardId=0");
	}
}
