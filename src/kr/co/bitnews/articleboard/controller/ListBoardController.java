package kr.co.bitnews.articleboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.Board;
import kr.co.bitnews.domain.Page;
import kr.co.bitnews.domain.PageResult;
import kr.co.bitnews.mapper.ArticleBoardMapper;
import kr.co.bitnews.mapper.FreeBoardMapper;

@WebServlet("/articleBoard/list")
public class ListBoardController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sPageNo = request.getParameter("pageNo");
		Page search = new Page();
		search.setPageNo(sPageNo != null ? Integer.parseInt(sPageNo) : 1);
		
		ArticleBoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ArticleBoardMapper.class);
		
		List<Board> list = mapper.selectBoard(search);
		int count = mapper.selectBoardCount(search);
		
		request.setAttribute("list", list);
		request.setAttribute("pageResult", new PageResult(search.getPageNo(), count));
		
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/articleboard/list.jsp");
		rd.forward(request, response);
	}
	
	public static void main(String[] args) {
		for (int count = 0; count < 100; count++) {
			// 마지막 페이지 구하기
			int p1 = (count % 10 == 0) ? count / 10 : count / 10 + 1;
			int p2 = (int)Math.ceil(count / 10d);
			System.out.println(p1 + "-" + p2);
		}
	}
}
