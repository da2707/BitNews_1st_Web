package kr.co.bitnews.article.controller;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import org.openqa.selenium.NoSuchElementException;  // util의 NoSuchElementException 과 다른 경우
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.Article;
import kr.co.bitnews.mapper.ArticleMapper;

@WebServlet("/articlecrawling")
public class ArticleDB extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArticleMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ArticleMapper.class);
		System.setProperty("webdriver.chrome.driver", new File("C:\\java-lec\\2nd_git\\mini_2nd\\chrome\\chromedriver.exe").getAbsolutePath()); //크롬 드라이버 파일 경로설정
		WebDriver driver = new ChromeDriver();
		driver.get("http://www.hellodd.com/?md=news");
		driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS); //응답시간 5초설정
		String name = "";
		List<WebElement> list = driver.findElements(By.cssSelector("#list_area > ul > li"));
		List<Article> aList = new ArrayList<>();
		for (WebElement e : list) {
			Article a = new Article();
			String[] noArr = e.findElement(By.cssSelector("div.article > h3 > a")).getAttribute("href").split("pid=");
			Article no = mapper.selectArticleByNo(Integer.parseInt(noArr[1]));
//			System.out.println("dbno :  scrapno : " + noArr[1]);
			System.out.println("체크 시작!");
			if (no == null) a.setArticleNo(Integer.parseInt(noArr[1]));
			else continue;
			System.out.println("널값 으로 else 건너뜀 VO에 데이터 저장 ");
			a.setArticleType("hellodd");
			a.setArticleTitle(e.findElement(By.tagName("h3")).getText());
			a.setArticleUrl(e.findElement(By.cssSelector("div.article > h3 > a")).getAttribute("href"));
			a.setArticleSummary(e.findElement(By.cssSelector("div.article > span > a")).getText());
			try {
				a.setArticleThumb(e.findElement(By.cssSelector("div.thumb > a > img")).getAttribute("src"));
			}catch (NoSuchElementException e1) {
				System.out.println("엘리먼트 못참음");
				a.setArticleThumb(" ");
			}
			name = e.findElement(By.cssSelector("div.article > p")).getText();
			String[] arr = name.split(" \\| ");
			SimpleDateFormat sd = new SimpleDateFormat("yyyy.MM.dd");
			if(arr.length == 2) {
				a.setArticleReporter(arr[0]);
				a.setArticleDate(arr[1]);
			}else {
				a.setArticleDate(arr[0]);
				a.setArticleReporter("hellodd");
			}
//			mapper.insertArticle(a);
//			System.out.println(a.toString());
			aList.add(a);
		}
//		css 크롤링
//		List<String> sList = new ArrayList<>();
//		System.out.println("------------------------------");
//		sList.add(driver.findElement(By.cssSelector("head > link:nth-child(9)")).getAttribute("href"));
//		sList.add(driver.findElement(By.cssSelector("head > link:nth-child(10)")).getAttribute("href"));
//		sList.add(driver.findElement(By.cssSelector("head > link:nth-child(11)")).getAttribute("href"));
//		sList.add(driver.findElement(By.cssSelector("head > link:nth-child(12)")).getAttribute("href"));
//		sList.add(driver.findElement(By.cssSelector("head > link:nth-child(13)")).getAttribute("href"));
//		System.out.println(driver.findElement(By.cssSelector("head > link:nth-child(13)")).getAttribute("href"));
//		System.out.println("------------------------------");
		driver.close();
//		for (Article a : aList) {
//			System.out.println(a.toString());
//			mapper.insertArticle(a);
//		}
		request.setAttribute("aList", aList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/DB");
		rd.forward(request, response);
	}

	
}
