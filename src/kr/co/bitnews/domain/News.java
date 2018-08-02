package kr.co.bitnews.domain;

import java.util.List;

public class News {
	
	private int newsSeq;
	private String newsId;
	private String userId;
	
	public int getNewsSeq() {
		return newsSeq;
	}
	public void setNewsSeq(int newsSeq) {
		this.newsSeq = newsSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNewsId() {
		return newsId;
	}
	public void setNewsId(String newsId) {
		this.newsId = newsId;
	}

}
