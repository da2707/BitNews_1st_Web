package kr.co.bitnews.freeboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.Board;
import kr.co.bitnews.mapper.FreeBoardMapper;

@WebServlet("/freeBoard/updateForm")
public class UpdateFormBoardController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FreeBoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(FreeBoardMapper.class);
		Board board = mapper.selectBoardByNo(Integer.parseInt(request.getParameter("no")));
		request.setAttribute("board", board);
		
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/freeboard/updateForm.jsp");
		rd.forward(request, response);
	}
}
