package kr.co.bitnews.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.User;
import kr.co.bitnews.mapper.UserMapper;

@WebServlet("/findacc")
public class FindAccountController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
		
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		User user = mapper.selectAcc(name);
		
		if(user == null) {
			//request.setAttribute("errMsg", "이름을 확인하세요");
		}
		else if(user.getUserName().equals(name) && user.getUserEmail().equals(email)) {
			
		}
		else {
			request.setAttribute("errMsg", "이메일을 확인하세요");
		}
		RequestDispatcher rd = request.getRequestDispatcher(
				"/jsp/user/findaccount.jsp"
				);
		rd.forward(request, response);
		
		 
		
		
	}	
}


















