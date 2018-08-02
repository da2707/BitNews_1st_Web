package kr.co.bitnews.usedboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.mapper.UsedBoardMapper;

@WebServlet("/usedBoard/delete")
public class DeleteBoardController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsedBoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UsedBoardMapper.class);
		mapper.deleteBoard(Integer.parseInt(request.getParameter("no")));
		
		response.sendRedirect("list");
	}
}
