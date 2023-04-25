package com.koreaIT.demo.vo;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreaIT.demo.util.Util;

import lombok.Getter;

public class Rq {

	@Getter
	private int loginedMemberId;
	private HttpServletResponse resp;

	public Rq(HttpServletRequest req, HttpServletResponse resp) {
		
		this.resp = resp;
		
		HttpSession httpSession = req.getSession();
		
		int loginedMemberId =  0;
		
		if (httpSession.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int)httpSession.getAttribute("loginedMemberId");
		}
		
		this.loginedMemberId = loginedMemberId;
	}

	public void jsPrintHistoryBack(String msg) {
		resp.setContentType("text/html; charset=UTF-8;");
		
		try {
			if(msg == null) {
				msg = "";
			}
			
			resp.getWriter().append(Util.f("""
						<script>
							const msg = '%s'.trim();
							if (msg.length > 0) {
								alert(msg);
							}
							history.back();
						</script>
						""", msg));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
