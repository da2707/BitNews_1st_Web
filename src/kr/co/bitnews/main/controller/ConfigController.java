package kr.co.bitnews.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.News;
import kr.co.bitnews.domain.User;
import kr.co.bitnews.mapper.NewsMapper;

@WebServlet("/config")
public class ConfigController extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(NewsMapper.class); 
		String[] newsId = request.getParameterValues("newsId");
		User user = (User) request.getSession().getAttribute("user");
		if(newsId != null) {
			List<String> list = new ArrayList<>();
			Collections.addAll(list, newsId);
//		System.out.println(list.size());
//		System.out.println("서블릿 옴");
			mapper.deleteNewsById(user.getUserId());
			for (String newsid : list) {
				News news = new News();
				news.setNewsId(newsid);
				news.setUserId(user.getUserId());
				mapper.insertNews(news);
			}
		}else {
			mapper.deleteNewsById(user.getUserId());
		}
		response.sendRedirect(request.getContextPath() + "/main");
	}
	

}
