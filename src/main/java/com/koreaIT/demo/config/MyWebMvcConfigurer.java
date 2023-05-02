package com.koreaIT.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.koreaIT.demo.interceptor.BeforeActionInterceptor;
import com.koreaIT.demo.interceptor.DontNeedLoginInterceptor;
import com.koreaIT.demo.interceptor.NeedLoginInterceptor;

@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer{
	private BeforeActionInterceptor beforeActionInterceptor;
	private NeedLoginInterceptor needLoginInterceptor;
	private DontNeedLoginInterceptor dontNeedLoginInterceptor;

	@Autowired
	public MyWebMvcConfigurer(BeforeActionInterceptor beforeActionInterceptor, NeedLoginInterceptor needLoginInterceptor, DontNeedLoginInterceptor dontNeedLoginInterceptor) {
		this.beforeActionInterceptor = beforeActionInterceptor;
		this.needLoginInterceptor = needLoginInterceptor;
		this.dontNeedLoginInterceptor = dontNeedLoginInterceptor;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(beforeActionInterceptor).addPathPatterns("/**").excludePathPatterns("/resource/**");
		
		registry.addInterceptor(needLoginInterceptor).addPathPatterns("/usr/article/write")
		.addPathPatterns("/usr/article/doWrite").addPathPatterns("/usr/article/doDelete")
		.addPathPatterns("/usr/article/modify").addPathPatterns("/usr/article/doModify")
		.addPathPatterns("/usr/member/doLogout").addPathPatterns("/usr/member/profile");
		
		
		registry.addInterceptor(dontNeedLoginInterceptor).addPathPatterns("/usr/member/doLogin")
		.addPathPatterns("/usr/member/doJoin");
	}
	
	
	
}
