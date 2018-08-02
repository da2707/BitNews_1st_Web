package kr.co.bitnews.articleboard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.mapper.ArticleBoardMapper;

@WebServlet("/articleBoard/commentDelete")
public class CommentDeleteController extends HttpServlet {

	@Override
	public void doGet(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArticleBoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ArticleBoardMapper.class);
		
		int no = Integer.parseInt(request.getParameter("no"));
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		
		mapper.deleteComment(commentNo);
		
		response.setContentType("application/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		out.println(new Gson().toJson(mapper.selectCommentByNo(no)));
		
	}
}











