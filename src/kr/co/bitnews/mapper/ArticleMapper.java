package kr.co.bitnews.mapper;

import java.util.List;

import kr.co.bitnews.domain.Article;
import kr.co.bitnews.domain.Page;


public interface ArticleMapper {
	public void insertArticle(Article article);
	public Article selectArticleByNo(int no);
	public List<Article> selectArticle(Page page);
	public int selectArticleCount(Page page);
	public List<Article> selectRank();
	public List<Article> selectRand();
}
