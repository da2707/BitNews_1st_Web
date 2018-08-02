package kr.co.bitnews.domain;

import java.util.Date;

public class MyScrap {
	private int scrapNo;
	private Date scrapDate;
	private String articleTitle;
	private String articleSummary;
	private int articleNo;	
	
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public int getScrapNo() {
		return scrapNo;
	}
	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
	}
	public Date getScrapDate() {
		return scrapDate;
	}
	public void setScrapDate(Date scrapDate) {
		this.scrapDate = scrapDate;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public String getArticleSummary() {
		return articleSummary;
	}
	public void setArticleSummary(String articleSummary) {
		this.articleSummary = articleSummary;
	}
	
	
}
