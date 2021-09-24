package kr.ac.spicy.crawler;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import kr.ac.spicy.model.Crawler;

public class SeleniumCrawler2 {
	private WebDriver driver;
	private List<WebElement> elements;
	private String url;
	
	public SeleniumCrawler2() {
		//시스템에 드라이버 실행파일을 할당
		System.setProperty("webdriver.chrome.driver", "C:\\chromedriver_win32\\chromedriver.exe");
		
		//실행할 크롬의 옵션을 설정
		ChromeOptions options = new ChromeOptions();
		options.addArguments("--start-maximized");  //화면 최대 크리
		options.addArguments("--disable-popup-blocking");  //팝업창 금지
		options.addArguments("headless");  //창 안띄우고 처리하기
		
     //크롬 창 열기
		driver = new ChromeDriver(options);
		
		url = "https://www.youtube.com/";
		
		
	}
	
	public List<Crawler> activateBot(String search) {
		//src를 담을 list
		List<Crawler> list = new ArrayList<Crawler>();
		
		try {
			//크롬창에 url 넣기
			driver.get(url);
			
			//구글이미지 검색에서 검색어 넣어서 검색 실행
			WebElement elem = driver.findElement(By.name("search_query"));
				elem.sendKeys("고양이");
				elem.submit();				
			
				
			//img 태그의 rg_i 클래스를 가진 요소 선택
			elements = driver.findElements(By.cssSelector("ytd-video-renderer"));  //아이디가 thumbnail인것을 선택		
			
			for(WebElement e : elements) {
				Crawler c = new Crawler();
				WebElement el = e.findElement(By.cssSelector("#thumbnail"));
				c.setHref(el.getAttribute("href"));
				c.setImg(el.findElement(By.cssSelector("#img")).getAttribute("src"));
				c.setTitle(e.findElement(By.cssSelector("#video-title")).getAttribute("title"));
				list.add(c);
				
			}
			
			//src 리스트 반환
			return list;
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			driver.close(); // 5. 브라우저 종료
		}
		
		return null;
	}
	
	

}