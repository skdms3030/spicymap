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
			
			//검색창의 name을 넣어줌
			WebElement elem = driver.findElement(By.name("search_query"));
				//검색창에 입력할 키원드
				elem.sendKeys("고양이");
				elem.submit();				
			
				
			//태그가 ytd-video-renderer인것을 선택해서 elements로 선언
			elements = driver.findElements(By.cssSelector("ytd-video-renderer"));  
			
			/*
			//elements 리스트들을 하나씩 볼 건데 그 하나들을 e라고 부르겠음
			for(WebElement e : elements) {
				Crawler c = new Crawler();
				//element 안에서 아이디가 thumbnail인것을 선택해서 el로 선언
				WebElement el = e.findElement(By.cssSelector("#thumbnail"));
				//el에서 href라는 속성을 crawler의 href 속성으로 set해줌
				c.setHref(el.getAttribute("href"));
				//el안에서 아이디가 img인것을 찾고 그것의 src 속성을 crawler의 img 속성으로 set
				c.setImg(el.findElement(By.cssSelector("#img")).getAttribute("src"));
				//e안에서 아이디가 video-title인 것을 찾고 그것의 title을 crawler의 title로 set
				c.setTitle(e.findElement(By.cssSelector("#video-title")).getAttribute("title"));
				//지금 set한 한 세트를 리스트에 추가해줌
				list.add(c);
			}
			*/
			
			//list의 길이를 3으로 제한
			for(int i=0; i<3; i++) {
				Crawler c = new Crawler();
				//elements중 i번째를 e로 선언
				WebElement e = elements.get(i);
				//element 안에서 아이디가 thumbnail인것을 선택해서 el로 선언
				WebElement el = e.findElement(By.cssSelector("#thumbnail"));
				//el에서 href라는 속성을 crawler의 href 속성으로 set해줌
				c.setHref(el.getAttribute("href"));
				//el안에서 아이디가 img인것을 찾고 그것의 src 속성을 crawler의 img 속성으로 set
				c.setImg(el.findElement(By.cssSelector("#img")).getAttribute("src"));
				//e안에서 아이디가 video-title인 것을 찾고 그것의 title을 crawler의 title로 set
				c.setTitle(e.findElement(By.cssSelector("#video-title")).getAttribute("title"));
				//지금 set한 한 세트를 리스트에 추가해줌
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