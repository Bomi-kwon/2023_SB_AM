package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.koreaIT.demo.vo.Article;

@Mapper
public interface ArticleRepository {

	public void writeArticle(String title, String body, int memberId, int boardId);
	
	public int getLastInsertId();
	
	public Article getArticleById(int id);
	
	public List<Article> getArticles(int boardId, int limitStart, int itemsInAPage, String keyWordType, String keyWord);
	
	public void deleteArticle(int id);

	public void modifyArticle(int id, String title, String body);

	public Article getForPrintArticle(int id);

	public int getNumberOfArticles(int boardId, String keyWordType, String keyWord);

	public int increaseHit(int id);

}
