package kr.co.bitnews.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.Scrap;
import kr.co.bitnews.mapper.ScrapMapper;

@WebServlet("/ajax/dScrap")
public class DeleteScrap extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ScrapMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ScrapMapper.class);
		
		String scrapNo = req.getParameter("scrapNo");
		String id = req.getParameter("id");
		
		Scrap scrap = new Scrap();
		scrap.setScrapNo(Integer.parseInt(scrapNo));
		scrap.setUserId(id);
		
		mapper.deleteScrap(scrap);
		
		System.out.println("2"+scrapNo);
		System.out.println("1"+id);
		
	}

}
