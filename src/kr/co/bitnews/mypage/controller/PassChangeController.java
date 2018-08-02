package kr.co.bitnews.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.User;
import kr.co.bitnews.mapper.UserMapper;

@WebServlet("/mypage/passchange")
public class PassChangeController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf-8");
		UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
		User login = (User)req.getSession().getAttribute("user");
		
		User user = new User();
		String pwd = req.getParameter("pwd");
		String npwd = req.getParameter("npwd");
		user.setUserPw(npwd);
		user.setUserId(login.getUserId());
		
		System.out.println(pwd);
		System.out.println(npwd);
		
		int result = 0;
		//세션 패스워드와 입력받은 패스워드가 같다면 데이터베이스 비밀번호를 바꿔야한다.
		if(login.getUserPw().equals(pwd)) {
			mapper.updatePass(user);
			result = 1;
		}else {
			result = 0;
		}
		
		PrintWriter out = resp.getWriter();
		out.print("{\"result\": " + result + "}");
		out.close();
		}
}
