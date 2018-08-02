package kr.co.bitnews.article.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.Article;
import kr.co.bitnews.mapper.ArticleMapper;

@WebServlet("/newsDetail")
public class NewsDetailController extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArticleMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ArticleMapper.class);
		Article article = mapper.selectArticleByNo(Integer.parseInt(request.getParameter("no")));
		
		
		request.setAttribute("article", article);
		request.setAttribute("randList", mapper.selectRand());
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/news/newsdetail.jsp");
		rd.forward(request, response);
	}

	
}
