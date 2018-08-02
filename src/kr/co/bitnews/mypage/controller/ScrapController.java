package kr.co.bitnews.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.MyScrap;
import kr.co.bitnews.domain.User;
import kr.co.bitnews.mapper.MyScrapMapper;

@WebServlet("/mypage/scrap")
public class ScrapController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MyScrapMapper mapper =  MyAppSqlConfig.getSqlSession().getMapper(MyScrapMapper.class);
		User login = (User)req.getSession().getAttribute("user");
		
		List<MyScrap> scrap =  mapper.selectScrapById(login.getUserId());
		
		req.setAttribute("list", scrap);
				
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/mypage/myscrap.jsp");
		rd.forward(req, resp);
	}

}
