package com.koreaIT.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsrHomeController {

	int cnt;
	
	@RequestMapping("/usr/home/main")
	@ResponseBody
	public int showMain() {
		cnt++;
		return cnt;
	}
	
}
