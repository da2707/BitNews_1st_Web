package kr.co.bitnews.mapper;

import java.util.List;

import kr.co.bitnews.domain.News;
import kr.co.bitnews.domain.NewsImg;

public interface NewsMapper {
	public void insertNews(News news);
	public List<String> selectNewsByUser(String userId);
	public int deleteNewsById(String userId);
	public void insertNewsImg(NewsImg newsimg); 
	public NewsImg selectNewsImgByid(String newsId);
	public List<NewsImg> selectNewsImg();
	public List<String> selectnewsImgByDay(String newsId);
	public NewsImg selectAfterNews(String day);
}
