package kr.co.bitnews.article.controller;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.Article;
import kr.co.bitnews.mapper.ArticleMapper;

@WebServlet("/DB")
public class DBServlet extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArticleMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ArticleMapper.class);
		List<Article> List = (List<Article>)request.getAttribute("aList");
//		System.out.println(list.size());
		System.setProperty("webdriver.chrome.driver", "C:\\java-lec\\2nd_git\\mini_2nd\\chrome\\chromedriver.exe"); //크롬 드라이버 파일 경로설정
		WebDriver driver = new ChromeDriver();		
		for (Article a : List) {
			System.out.println(a.getArticleTitle());
			System.out.println(a.getArticleSummary());
			driver.get(a.getArticleUrl());
			driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS); //응답시간 5초설정
			String content = driver.findElement(By.cssSelector("#newsvw > div.article_body")).getText().trim();
			if(content.length() > 1100) a.setArticleContent(content.substring(0, 1100));
			else a.setArticleContent(content);
			System.out.println(a.getArticleContent().length());
			System.out.println(a.getArticleContent());
			System.out.println(a.toString());
			mapper.insertArticle(a);
			System.out.println("-------------------------------------------------------------------------------------");
		}
		driver.close();
//		request.setAttribute("aList", aList);
//		List<Article> list = mapper.selectArticle();
		
//		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/newsList?type=hellodd");
		rd.forward(request, response);
	}

	
}
