package com.koreaIT.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.ReplyService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Rq;

@Controller
public class UsrReplyController {

	private ReplyService replyService;
	private Rq rq;

	@Autowired
	public UsrReplyController(ReplyService replyService, Rq rq) {
		this.replyService = replyService;
		this.rq = rq;
	}

	@RequestMapping("/usr/reply/doWriteReply")
	@ResponseBody
	public String doWriteReply(String relTypeCode, String relId, String replybody) {
		
		replyService.doWriteReply(rq.getLoginedMemberId(), relTypeCode, relId, replybody);
		
		return Util.jsReplace(Util.f("%d번 게시물에 댓글을 작성했습니다.", relId), Util.f("../article/detail?id=%d", relId));
	}
}