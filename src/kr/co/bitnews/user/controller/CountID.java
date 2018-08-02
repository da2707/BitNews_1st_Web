package kr.co.bitnews.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.mapper.UserMapper;

@WebServlet("/user/countid")
public class CountID extends HttpServlet {
	@Override
	public void service(
			HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType(
				"application/json; charset=utf-8");
		String id = request.getParameter("id");
		UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
		int count = mapper.selectMemberCount(id);
		PrintWriter out = response.getWriter();
		out.write("{\"result\": " + count + "}");
		out.close();
	}
}
