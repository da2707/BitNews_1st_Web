package kr.co.bitnews.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.User;
import kr.co.bitnews.mapper.UserMapper;

@WebServlet("/mypage/leave")
public class LeaveController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf-8");
		UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
		User login = (User)req.getSession().getAttribute("user");
		//세션 가져옴
		String pass = req.getParameter("pwd");
		
		int result = 0;
		//위 아래 값이 일치하면 1/아니면 0
		if(login.getUserPw().equals(pass)) {
			mapper.withdrawUser(login.getUserId());
			result = 1;
		}else {
			result = 0;
		}
		PrintWriter out = resp.getWriter();
		out.print("{\"result\": " + result + "}");
		out.close();
					
		/*
		System.out.println(pass);
		System.out.println(login.getUserPw());
		//데이터베이스 비밀번호와 jsp 입력값 비교 -> 값이 일치한다면 탈퇴
		if(login.getUserPw().equals(pass)) {
			mapper.withdrawUser(login.getUserId());
			//resp.sendRedirect("/mini_2nd/main");
		}else {
			
		}
		*/		 
	}

}
