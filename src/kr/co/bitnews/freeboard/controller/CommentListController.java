package kr.co.bitnews.freeboard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.mapper.FreeBoardMapper;

@WebServlet("/freeBoard/commentList")
public class CommentListController extends HttpServlet {
	
	@Override
	public void service(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FreeBoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(FreeBoardMapper.class);
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		response.setContentType("application/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		out.println(new Gson().toJson(mapper.selectCommentByNo(no)));
	}
}











