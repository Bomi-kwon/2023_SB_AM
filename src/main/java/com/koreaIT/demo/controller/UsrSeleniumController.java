package com.koreaIT.demo.controller;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UsrSeleniumController {
	
	private String url = "https://cafe.naver.com/suhui";
	
	@GetMapping("/usr/selenium/entranceinfo")
	public String entranceinfo() throws InterruptedException {
		String result = "";
		
		System.out.println("까꿍");
		
		Path path = Paths.get("C:\\bbomi\\chromedriver\\chromedriver.exe");
		
		System.setProperty("webdriver.chrome.driver", path.toString());
		
		ChromeOptions options = new ChromeOptions();
		
		// options.addArguments("--disable-popup-blocking");   // 팝업 안띄움
        // options.addArguments("headless");   // 브라우저 안띄움
        // options.addArguments("--disable-gpu");  // gpu 비활성화
        // options.addArguments("--blink-settings=imagesEnabled=false");   // 이미지 다운 안받음
		options.addArguments("--remote-allow-origins=*");
		
		WebDriver driver = new ChromeDriver(options);
		// driver.manage().window().maximize();
		
		//WebDriver을 해당 url로 이동한다.
		driver.get(url);
		
		Thread.sleep(1000);
		
		driver.findElement(By.cssSelector("#menuLink3782")).click();
		
		Thread.sleep(1000);
		
		// 태그에 접근 후 iframe 태그로 이동합니다.

		driver.switchTo().frame(driver.findElement(By.cssSelector("iframe#cafe_main")));
		
		List<WebElement> contents = new ArrayList<>();
		
		for(int i = 0 ; i < 5 ; i++) {
		
			contents = driver.findElements(By.cssSelector("#main-area > div:nth-child(4) > table > tbody > tr"));
		
			for(WebElement content : contents) {
				String title = content.findElement(By.cssSelector("td.td_article > div.board-list > div > a.article")).getText();
				String date = content.findElement(By.cssSelector("td.td_date")).getText();
				String url = content.findElement(By.cssSelector("td.td_article > div.board-list > div > a.article")).getAttribute("href");
			
				result += "제목 : " + title + "<br />";
				result += "날짜 : " + date + "<br />";
				result += "공지 url : " + url + "<br /><br />";
			}
		
			driver.findElement(By.cssSelector("#main-area > div.prev-next > a.on + a")).click();
					
			
		}
		
		
		// driver.quit();
		
		
		return result;
	}
	
}
