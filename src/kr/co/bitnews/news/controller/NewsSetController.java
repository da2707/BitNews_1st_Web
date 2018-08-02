package kr.co.bitnews.news.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.User;
import kr.co.bitnews.mapper.NewsMapper;

@WebServlet("/setting")
public class NewsSetController extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(NewsMapper.class);
		User u = (User) request.getSession().getAttribute("user");
		List<String> newsIdList = mapper.selectNewsByUser(u.getUserId());
		if(newsIdList != null){
			request.setAttribute("newsid", newsIdList);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/config/newsconfig.jsp");
		rd.forward(request, response);
	}
	
}
