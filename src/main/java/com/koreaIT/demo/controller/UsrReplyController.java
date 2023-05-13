package com.koreaIT.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.ReplyService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Reply;
import com.koreaIT.demo.vo.ResultData;
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
	public String doWriteReply(String relTypeCode, int relId, String replybody) {
		
		replyService.doWriteReply(rq.getLoginedMemberId(), relTypeCode, relId, replybody);
		
		return Util.jsReplace(Util.f("%d번 게시물에 댓글을 작성했습니다.", relId), Util.f("../article/detail?id=%d", relId));
	}
	
	@RequestMapping("/usr/reply/getReplyContent")
	@ResponseBody
	public ResultData<Reply> getReplyContent(int id) {
		
		Reply reply = replyService.getReply(id);
		
		if(reply == null) {
			return ResultData.from("F-1", "존재하지 않는 댓글입니다.");
		}
		
		return ResultData.from("S-1", "댓글 정보 조회 성공", "reply", reply);
	}
	
	@RequestMapping("/usr/reply/doModifyReply")
	@ResponseBody
	public String doModifyReply(int id, String replybody, int replymemberId) {
		
		Reply reply = replyService.getReply(id);
		
		if(replymemberId != rq.getLoginedMemberId()) {
			return Util.jsReplace(Util.f("%d번 게시물의 댓글 수정 권한이 없습니다.", reply.getRelId()), Util.f("../article/detail?id=%d", reply.getRelId()));
		}
		
		replyService.doModifyReply(id, replybody);
		
		return Util.jsReplace(Util.f("%d번 댓글을 수정했습니다.", id), Util.f("../article/detail?id=%d", reply.getRelId()));
	}
	
	@RequestMapping("/usr/reply/doDeleteReply")
	@ResponseBody
	public String doDeleteReply(int id, int replymemberId) {
		
		Reply reply = replyService.getReply(id);
		
		if(replymemberId != rq.getLoginedMemberId()) {
			return Util.jsReplace(Util.f("%d번 게시물의 댓글 삭제 권한이 없습니다.", reply.getRelId()), Util.f("../article/detail?id=%d", reply.getRelId()));
		}
		
		replyService.doDeleteReply(id);
		
		return Util.jsReplace(Util.f("%d번 게시물의 댓글을 삭제했습니다.", reply.getRelId()), Util.f("../article/detail?id=%d", reply.getRelId()));
	}
	
	
}