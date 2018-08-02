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
import kr.co.bitnews.domain.MyComment;
import kr.co.bitnews.domain.User;
import kr.co.bitnews.mapper.MyScrapMapper;

@WebServlet("/mypage/comment")
public class CommentController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	MyScrapMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(MyScrapMapper.class);
	User login = (User)req.getSession().getAttribute("user");
	
    List<MyComment> comment =  mapper.selectCommentById(login.getUserId());
	
    req.setAttribute("list", comment);
    
	RequestDispatcher rd= req.getRequestDispatcher("/jsp/mypage/mycomment.jsp");
	rd.forward(req, resp);
	}

}
