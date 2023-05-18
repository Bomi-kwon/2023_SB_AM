package com.koreaIT.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrAPITestController {

	@RequestMapping("/usr/home/APITest")
	public String APITest(Model model) {
		return "usr/home/APITest";
	}
	
	@RequestMapping("/usr/home/APITest2")
	public String APITest2() {
		return "/usr/home/APITest2";
	}
	
}
