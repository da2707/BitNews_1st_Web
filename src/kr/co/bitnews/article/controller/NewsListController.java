package kr.co.bitnews.article.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.Article;
import kr.co.bitnews.domain.Page;
import kr.co.bitnews.domain.PageResult;
import kr.co.bitnews.mapper.ArticleMapper;

@WebServlet("/newsList")
public class NewsListController extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArticleMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ArticleMapper.class);
		String sPageNo = request.getParameter("pageNo");
		Page search = new Page();
		search.setPageNo(sPageNo != null ? Integer.parseInt(sPageNo) : 1);
			
		List<Article> list = mapper.selectArticle(search);
		
		int count = mapper.selectArticleCount(search);
//		System.out.println(request.getParameter("type"));
		// 롤링 뉴스
		List<Article> rList = mapper.selectRank();
//		System.out.println(rList.size());
		request.setAttribute("list", list);
		request.setAttribute("rList", rList);
		request.setAttribute("pageResult", new PageResult(search.getPageNo(), count));
		request.setAttribute("type", request.getParameter("type"));
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/news/newslist.jsp");
		rd.forward(request, response);
	}

	
}
