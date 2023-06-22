package com.koreaIT.demo.controller;

import java.time.Duration;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.ArticleService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.service.ReactionPointService;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;

@Controller
public class UsrHomeController {
	private ArticleService articleService;
	private MemberService memberService;
	private ReactionPointService reactionPointService;
	private Rq rq;
	
	public UsrHomeController(ArticleService articleService, MemberService memberService, ReactionPointService reactionPointService, Rq rq) {
		this.articleService = articleService;
		this.memberService = memberService;
		this.reactionPointService = reactionPointService;
		this.rq = rq;
	}

	@RequestMapping("/usr/home/main")
	public String showMain(Model model) {
		
		if(rq.getLoginedMemberId() != 0) {
			Member member = memberService.getMemberById(rq.getLoginedMemberId());
			int myArticlesCnt = articleService.getMyArticlesCnt(member.getId());
			int myLikesCnt = reactionPointService.getMyLikesCnt(member.getId());
			model.addAttribute("member", member);
			model.addAttribute("myArticlesCnt", myArticlesCnt);
			model.addAttribute("myLikesCnt", myLikesCnt);
		}
		
		return "usr/home/main";
	}
	
	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
	
	@RequestMapping("/usr/home/popup")
	public String showPopup() {
		return "usr/home/popup";
	}
	
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver"; //드라이버 ID
	public static final String WEB_DRIVER_PATH = "C:\\bbomi\\chromedriver\\chromedriver.exe"; //드라이버 경로
	
	@RequestMapping("/usr/home/entranceinfo")
	@ResponseBody
	public String entranceinfo() {
		
		System.out.println("까꿍");
		
		try {
			System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		ChromeOptions options = new ChromeOptions();
		
		// options.addArguments("headless");   // 브라우저 안띄움
		options.addArguments("--remote-allow-origins=*");
		
		WebDriver driver = new ChromeDriver(options);
		
		WebDriverWait webDriverWait = new WebDriverWait(driver, Duration.ofSeconds(10));
		
		//이동을 원하는 url
		String url = "https://cafe.naver.com/suhui?iframe_url=/ArticleList.nhn%3Fsearch.clubid=10197921%26search.menuid=2016%26search.boardtype=L";
		
		//WebDriver을 해당 url로 이동한다.
		driver.get(url);
		
		webDriverWait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#upperArticleList > table > tbody > tr.type_up")));
		
		String result = "";
		
		//WebElement는 html의 태그를 가지는 클래스이다.
		List<WebElement> contents = driver.findElements(By.cssSelector("#upperArticleList > table > tbody > tr.type_up"));
		
		if(contents.size() > 0) {
			for(WebElement content : contents) {
				String title = content.findElement(By.cssSelector("td.td_article > div.board-list > div > a.article")).getText();
				result += "제목 : " + title + "<br />";
			}
			
		}
		
		driver.close();
		driver.quit();
		
		return result;
	}
	
}
