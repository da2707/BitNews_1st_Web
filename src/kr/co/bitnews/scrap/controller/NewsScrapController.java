package kr.co.bitnews.scrap.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.Scrap;
import kr.co.bitnews.domain.User;
import kr.co.bitnews.mapper.ScrapMapper;

@WebServlet("/ajax/newsScrap")
public class NewsScrapController extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ScrapMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ScrapMapper.class);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
//		기사 번호
		String no = request.getParameter("no");
		System.out.println(no);
//		세션데이터 Login user id 
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<Scrap> sList = mapper.selectScrapById(user.getUserId());
		for (Scrap s : sList) {
			if(s.getArticleNo() == Integer.parseInt(no)){
				out.print("해당 기사는 이미 스크랩 되어있습니다.");
				out.close();
				return;
			}			
		}
		Scrap scrap = new Scrap();
		scrap.setArticleNo(Integer.parseInt(no));
		scrap.setUserId(user.getUserId());
		mapper.insertScrap(scrap);
		out.print("해당 기사를 스크랩 하였습니다.");
		out.close();
	}
	
}
