package kr.co.bitnews.domain;

import java.util.Date;

public class Board {
	// public BoardVO() {} <- 기본 생성자
	/** 글 번호 */
	private int no;
	/** 글쓴이 */
	private String userId;
	/** 제목 */
	private String title;
	/** 내용 */
	private String content;
	/** 등록일 */
	private Date regDate;
	
	private int viewCnt;
	
	private String head;
	
	private int cmtCount;
	
	public int getCmtCount() {
		return cmtCount;
	}
	public void setCmtCount(int cmtCount) {
		this.cmtCount = cmtCount;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	// this -> 실행중인 인스턴스 객체를 나타내는 히든변수
	// static 으로 선언되어 있지 않은 메서드의 첫번째 매개변수로 할당되어 있다.
	// static 으로 선언되어 있지 않은 메서드를 인스턴스 메서드라 한다.
	public void setNo(/*BoardVO this, */int no) {
		this.no = no;
	}
	public int getNo() {
		return no;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserId() {
		return userId;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return title;
	}
	
	/**
	 * 게시글의 내용을 설정한다.
	 * @param content
	 */
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent() {
		return content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "Board [no=" + no + ", userName=" + userId + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", viewCnt=" + viewCnt + "]";
	}
}
