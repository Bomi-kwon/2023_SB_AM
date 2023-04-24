package com.koreaIT.demo.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.ArticleRepository;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Article;
import com.koreaIT.demo.vo.ResultData;

@Service
public class ArticleService {
	private ArticleRepository articleRepository;
	
	@Autowired
	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}

	public void writeArticle(String title, String body, int memberId) {
		articleRepository.writeArticle(title, body, memberId);
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
	
	public ResultData<Article> modifyArticle(int id, String title, String body) {
		
		articleRepository.modifyArticle(id, title, body);
		
		return ResultData.from("S-1", Util.f("%d번 게시물을 수정했습니다.", id), "id" ,getArticleById(id));
	}

	public List<Article> getArticles() {
		return articleRepository.getArticles();
	}

	public ResultData doModifyRd(int loginedMemberId, int article_memberId) {
		
		if (loginedMemberId != article_memberId) {
			return ResultData.from("F-1","게시물 수정 권한이 없습니다.");
		}
		
		return ResultData.from("S-1","수정 권한이 있습니다.");
	}

	public Article getForPrintArticle(int id) {
		return articleRepository.getForPrintArticle(id);
	}
	
}
