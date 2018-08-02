package kr.co.bitnews.mapper;

import java.util.List;
import kr.co.bitnews.domain.Board;
import kr.co.bitnews.domain.BoardFile;
import kr.co.bitnews.domain.Comment;
import kr.co.bitnews.domain.Page;

public interface FreeBoardMapper {

	Board selectBoardByNo(int no);
	void insertBoard(Board board);
	void updateBoard(Board board);
	void deleteBoard(int no);
	void updateBoardViewCnt(int no);
	
	List<Board> selectById(String userid);
	
	// 댓글 파트
	void insertComment(Comment comment);
	List<Comment> selectCommentByNo(int findNo);
	void deleteComment(int commentNo);
	void updateComment(Comment comment);
	
	// 첨부파일
	void insertBoardFile(BoardFile file);
	List<BoardFile>selectBoardFileByNo(int no);
	
	// 전체 게시글 조회
	List<Board> selectBoard(Page search);
	
	// 전체 게시글 개수
	int selectBoardCount(Page search);
	
	// 댓글 갯수
	int selectCommentCountByNo(int no);
	List<Integer> selectboardWithComment();
	

}
