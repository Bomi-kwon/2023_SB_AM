package com.koreaIT.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
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
	public MyWebMvcConfigurer(BeforeActionInterceptor beforeActionInterceptor, NeedLoginInterceptor needLoginInterceptor
			, DontNeedLoginInterceptor dontNeedLoginInterceptor) {
		this.beforeActionInterceptor = beforeActionInterceptor;
		this.needLoginInterceptor = needLoginInterceptor;
		this.dontNeedLoginInterceptor = dontNeedLoginInterceptor;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		InterceptorRegistration ir;
		
		ir = registry.addInterceptor(beforeActionInterceptor);
		ir.addPathPatterns("/**");
		ir.addPathPatterns("/favicon.ico");
		ir.excludePathPatterns("/resource/**");
		
		
		ir = registry.addInterceptor(needLoginInterceptor);
		ir.addPathPatterns("/usr/article/write");
		ir.addPathPatterns("/usr/article/doWrite");
		ir.addPathPatterns("/usr/article/doDelete");
		ir.addPathPatterns("/usr/article/modify");
		ir.addPathPatterns("/usr/article/doModify");
		ir.addPathPatterns("/usr/member/doLogout");
		ir.addPathPatterns("/usr/member/profile");
		ir.addPathPatterns("/usr/member/checkPassword");
		ir.addPathPatterns("/usr/member/doCheckPassword");
		ir.addPathPatterns("/usr/member/modifyMember");
		ir.addPathPatterns("/usr/member/doModifyMember");
		ir.addPathPatterns("/usr/member/modifyPassword");
		ir.addPathPatterns("/usr/member/doModifyPassword");
		ir.addPathPatterns("/usr/member/dropMember");
		ir.addPathPatterns("/usr/member/memberlist");
		ir.addPathPatterns("/usr/reactionPoint/doChangeReactionPoint");
		ir.addPathPatterns("/usr/reactionPoint/doDeleteReactionPoint");
		ir.addPathPatterns("/usr/reply/doWriteReply");
		ir.addPathPatterns("/usr/reply/getReplyContent");
		ir.addPathPatterns("/usr/reply/doModifyReply");
		ir.addPathPatterns("/usr/reply/doDeleteReply");
		
		
		ir = registry.addInterceptor(dontNeedLoginInterceptor);
		ir.addPathPatterns("/usr/member/join");
		ir.addPathPatterns("/usr/member/doJoin");
		ir.addPathPatterns("/usr/member/login");
		ir.addPathPatterns("/usr/member/doLogin");
	}
	
	
	
}
