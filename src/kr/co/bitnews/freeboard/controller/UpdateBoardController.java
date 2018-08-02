package kr.co.bitnews.freeboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.Board;
import kr.co.bitnews.mapper.FreeBoardMapper;

@WebServlet("/freeBoard/update")
public class UpdateBoardController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(FreeBoardMapper.class);
		//request.setCharacterEncoding("utf-8");
		
		Board board = new Board();
		board.setNo(Integer.parseInt(request.getParameter("no")));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		mapper.updateBoard(board);
		
		response.sendRedirect("detail?no="+ request.getParameter("no"));
	}
}
