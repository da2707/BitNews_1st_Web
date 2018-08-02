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
import kr.co.bitnews.mapper.FreeBoardMapper;

@WebServlet("/mypage/free")
public class FreeController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FreeBoardMapper mapper =  MyAppSqlConfig.getSqlSession().getMapper(FreeBoardMapper.class);
		User login = (User)req.getSession().getAttribute("user");
		List<Board> list = mapper.selectById(login.getUserId());//SelectByName(세션)
		
		req.setAttribute("list", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/mypage/freeboard.jsp");
		rd.forward(req, resp);
	}

}
