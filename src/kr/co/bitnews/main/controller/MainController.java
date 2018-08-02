package kr.co.bitnews.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.NewsImg;
import kr.co.bitnews.domain.User;
import kr.co.bitnews.mapper.NewsMapper;

@WebServlet("/main")
public class MainController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(NewsMapper.class);
		User user = (User)request.getSession().getAttribute("user");
		if(user != null){
			List<NewsImg> imgList = new ArrayList<>();
			List<String> newsidList =  mapper.selectNewsByUser(user.getUserId());
			for (String newsid : newsidList) {
//				System.out.println(newsid);
				NewsImg newsimg = mapper.selectNewsImgByid(newsid);
//				System.out.println(newsimg.getImgPath());
				imgList.add(newsimg);
			}
			if(newsidList.isEmpty() == true) {
				request.setAttribute("imgList", mapper.selectNewsImg());
			}else {
				request.setAttribute("imgList", imgList);
				request.setAttribute("dateList", mapper.selectnewsImgByDay(newsidList.get(0)));
			}
//			System.out.println(imgList.size());
		}else {
			request.setAttribute("imgList", mapper.selectNewsImg());
//			System.out.println(mapper.selectNewsImg().size());
		}
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/news/main.jsp");
		rd.forward(request, response);
	}
	
	

}