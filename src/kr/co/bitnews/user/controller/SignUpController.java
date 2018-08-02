package kr.co.bitnews.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;import com.oreilly.servlet.MultipartRequest;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.User;
import kr.co.bitnews.mapper.UserMapper;

@WebServlet("/user/sign")
public class SignUpController extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
	
		User user = new User();
		user.setUserId(request.getParameter("id"));
		System.out.println(request.getParameter("id"));
		user.setUserPw(request.getParameter("pw"));
		user.setUserName(request.getParameter("name"));
		user.setUserEmail(request.getParameter("email"));
		mapper.insertUser(user);
		
		
		
		
		

		RequestDispatcher rd = request.getRequestDispatcher("/main");
		rd.forward(request, response);
	}
	
	
}
