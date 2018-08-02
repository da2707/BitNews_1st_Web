package kr.co.bitnews.articleboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.mapper.ArticleBoardMapper;

@WebServlet("/articleBoard/delete")
public class DeleteBoardController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArticleBoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ArticleBoardMapper.class);
		mapper.deleteBoard(Integer.parseInt(request.getParameter("no")));
		
		response.sendRedirect("list");
	}
}
