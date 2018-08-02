package kr.co.bitnews.capture;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Point;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.NewsImg;
import kr.co.bitnews.mapper.NewsMapper;


@WebServlet("/capture")
public class CaptureController extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.setProperty("webdriver.chrome.driver", new File("C:\\java-lec\\2nd_git\\mini_2nd\\chrome\\chromedriver.exe").getAbsolutePath()); //크롬 드라이버 파일 경로설정

		ChromeOptions options = new ChromeOptions();
		options.addArguments("--start-maximized");
		WebDriver driver = new ChromeDriver(options);
		
		driver.get("http://newsstand.naver.com/?list=ct4");
		driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS); //응답시간 5초설정
//		List<String> divList = new ArrayList<>();
		for(int i=0; i<11; i++){
			driver.findElement(By.cssSelector("#rollingUl > li > #f_" + i)).click();
			WebElement we = driver.findElement(By.cssSelector("#focusPanelCenter > div"));

			System.out.println("Page title is: " + driver.getTitle());
			SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd/");
			String datePath = sd.format(new Date());
			String fileName = driver.findElement(By.cssSelector("#focusPanelCenter > div > iframe.ifr_arc")).getAttribute("title");
			try {
			  byte[] screengrab = ((TakesScreenshot) driver).getScreenshotAs(OutputType.BYTES);
			  BufferedImage img = ImageIO.read(new ByteArrayInputStream(screengrab));
			  Point topleft = we.getLocation();
			  Point bottomright = new Point(we.getSize().getWidth(), we.getSize().getHeight());
			  BufferedImage imgScreenshot = 
			      (BufferedImage)img.getSubimage(topleft.getX(), topleft.getY(), bottomright.getX(), bottomright.getY());
			  File screenshotLocation = new File("C:\\java-lec\\2nd_git\\mini_2nd\\WebContent\\captureimages\\" + datePath + fileName + ".png");
			  if(!screenshotLocation.exists()) screenshotLocation.mkdirs();
			  ImageIO.write(imgScreenshot, "png", screenshotLocation);
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(i + "추가");
			NewsMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(NewsMapper.class);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String newsId = "";
			switch (fileName) {
			case "IT조선 주요뉴스": newsId = "itchosun"; break;
			case "넥스트데일리 주요뉴스": newsId = "nextdaily"; break;
			case "디지털데일리 주요뉴스": newsId = "ddaily"; break;
			case "디지털타임스 주요뉴스": newsId = "dt"; break;
			case "보안뉴스 주요뉴스": newsId = "boannews"; break;
			case "블로터 주요뉴스": newsId = "bloter"; break;
			case "아이뉴스24 주요뉴스": newsId = "inews"; break;
			case "전자신문 주요뉴스": newsId = "etnews"; break;
			case "지디넷코리아 주요뉴스": newsId = "zdnet"; break;
			case "키뉴스 주요뉴스": newsId = "kinews"; break;
			case "헬로디디 주요뉴스": newsId = "hellodd"; break;
			}
			NewsImg newsimg = new NewsImg();
			newsimg.setDay(sdf.format(new Date()));
			newsimg.setImgPath(datePath + fileName + ".png");
			newsimg.setNewsId(newsId);
			mapper.insertNewsImg(newsimg);
			
			System.err.println(datePath + fileName + ".png");
		}
		driver.close();
		System.out.println("드라이버 클로즈");
		response.sendRedirect(request.getContextPath() + "/main");
	}
	
}
