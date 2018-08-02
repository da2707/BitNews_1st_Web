package kr.co.bitnews.usedboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.Board;
import kr.co.bitnews.domain.BoardFile;
import kr.co.bitnews.domain.Comment;
import kr.co.bitnews.mapper.UsedBoardMapper;

@WebServlet("/usedBoard/detail")
public class DetailBoardController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		// 필터 처리로 변경하기
		// 로그인 하지 않은 경우 로그인 폼으로 이동시킨다.
		HttpSession session = request.getSession();
		Login login = (Login)session.getAttribute("user");
		if (login == null) {
			response.sendRedirect(request.getContextPath() + "/login/login");
			return;
		}
		*/
		UsedBoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UsedBoardMapper.class);
		
		int no = Integer.parseInt(request.getParameter("no"));
		mapper.updateBoardViewCnt(no);
		Board board = mapper.selectBoardByNo(no);
		request.setAttribute("board", board);
		
		// 댓글 목록 정보 공유
		List<Comment> commentList = mapper.selectCommentByNo(no);
		request.setAttribute("commentList", commentList);

		// 댓글 목록에서 수정 링크 클릭 시에만 값이 넘어온다.
		request.setAttribute("commentNo", request.getParameter("commentNo"));	
		
		// 첨부파일 목록 가져오기
		List<BoardFile> fileList = mapper.selectBoardFileByNo(no);
		request.setAttribute("fileList", fileList);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/usedboard/detail.jsp");
		rd.forward(request, response);
	}
}





