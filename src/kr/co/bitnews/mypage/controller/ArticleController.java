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
import kr.co.bitnews.domain.Board;
import kr.co.bitnews.domain.User;
import kr.co.bitnews.mapper.ArticleBoardMapper;

@WebServlet("/mypage/article")
public class ArticleController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArticleBoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ArticleBoardMapper.class);
		User login = (User)req.getSession().getAttribute("user");
		List<Board> list = mapper.selectById(login.getUserId());//SelectByName(세션)
		
		req.setAttribute("list", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/mypage/articleboard.jsp");
		rd.forward(req, resp);
	}

}
