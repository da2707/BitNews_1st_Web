package kr.co.bitnews.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.User;
import kr.co.bitnews.mapper.UserMapper;

@WebServlet("/login/login")
public class LoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/user/login.jsp");
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//User u = mapper.selectUserById(id);
		User login = mapper.selectUserById(id);
		
		
		
		System.out.println("login : " + login);
		
		
		if(login == null) {
			request.setAttribute("errMsg", "아이디를 확인하세요");
		}
		else if(login.getUserWithdraw() == 1) {
			request.setAttribute("errMsg", "탈퇴한 회원입니다");
			
			RequestDispatcher rd = request.getRequestDispatcher(
					"/jsp/user/login.jsp"
					);
			rd.forward(request, response);
			
		}
		else if(login.getUserPw().equals(pw)) {
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("user", login);
			
			if(login.getUserId().equals("admin")) {
				response.sendRedirect(request.getContextPath() + "/main");
				return;
			}
			else {
			response.sendRedirect(request.getContextPath() + "/main");
			return;
			}
		}
		else {
			request.setAttribute("errMsg", "패스워드를 확인하세요");
		}
		RequestDispatcher rd = request.getRequestDispatcher(
				"/jsp/user/login.jsp"
				);
		rd.forward(request, response);
	}
	
	
	
}









