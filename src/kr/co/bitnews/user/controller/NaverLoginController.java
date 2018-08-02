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

@WebServlet("/naverlogin")
public class NaverLoginController extends HttpServlet {
		
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
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		int count = mapper.selectMemberCount(id);
		
		if(count == 0) {
			
			User user = new User();
			user.setUserId(request.getParameter("id"));
			user.setUserPw(request.getParameter("pw"));
			user.setUserName(request.getParameter("name"));
			user.setUserEmail(request.getParameter("email"));
			mapper.insertUser(user);
			System.out.println(request.getParameter("id"));
			
			
			
			
			
//			RequestDispatcher rd = request.getRequestDispatcher("/main");
//			
//			rd.forward(request, response);
			
//			response.sendRedirect(request.getContextPath() + "/main");
			
			
		}
		
		else if(count == 1) {
			HttpSession session = request.getSession();
			User login = mapper.selectUserById(id);
			session.setAttribute("user", login);
			response.sendRedirect(request.getContextPath() + "/main");
			return;
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
			
			
		
		
		

		
	
	
	










