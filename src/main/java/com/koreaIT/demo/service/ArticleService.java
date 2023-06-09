package com.koreaIT.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.ArticleRepository;
import com.koreaIT.demo.vo.Article;
import com.koreaIT.demo.vo.ResultData;

@Service
public class ArticleService {
	private ArticleRepository articleRepository;
	
	@Autowired
	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}

	public void writeArticle(String title, String body, int memberId, int boardId) {
		articleRepository.writeArticle(title, body, memberId, boardId);
	}
	
	public int getLastInsertId() {
		return articleRepository.getLastInsertId();
	}
	
	public Article getArticleById(int id) {
		return articleRepository.getArticleById(id);
	}
	
	public void deleteArticle(int id) {
		articleRepository.deleteArticle(id);
	}
	
	public void modifyArticle(int id, String title, String body) {
		
		articleRepository.modifyArticle(id, title, body);
	}

	public List<Article> getArticles(int boardId, int itemsInAPage, int page, String keyWordType, String keyWord) {
		
		int limitStart = (page - 1) * itemsInAPage;
		
		return articleRepository.getArticles(boardId, limitStart, itemsInAPage, keyWordType, keyWord);
	}

	public Article getForPrintArticle(int id) {
		Article article = articleRepository.getForPrintArticle(id);
		
		return article;
	}

	public void actorCanChangeData(int loginedMemberId, Article article) {
		
		ResultData actorCanChangeDataRd = actorCanMD(loginedMemberId, article);
		
		article.setActorCanChangeData(actorCanChangeDataRd.isSuccess());
		
	}

	public ResultData actorCanMD(int loginedMemberId, Article article) {
		if(article == null) {
			return ResultData.from("F-1", "해당 게시물은 존재하지 않습니다");
		}
		
		if(loginedMemberId == 0) {
			return ResultData.from("F-2", "로그인 후 이용해주세요.");
		}
		
		if (loginedMemberId != article.getMemberId()) {
			return ResultData.from("F-B", "해당 게시물에 대한 권한이 없습니다");	
		}
		
		return ResultData.from("S-1", "권한 있음");
	}

	public int getNumberOfArticles(int boardId, String keyWordType, String keyWord) {
		return articleRepository.getNumberOfArticles(boardId, keyWordType, keyWord);
	}

	public void increaseHit(int id) {
		articleRepository.increaseHit(id);
	}

	public int getMyArticlesCnt(int memberId) {
		return articleRepository.getMyArticlesCnt(memberId);
	}

}
