package com.koreaIT.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.ReplyRepository;
import com.koreaIT.demo.vo.Reply;

@Service
public class ReplyService {

	private ReplyRepository replyRepository;

	@Autowired
	public ReplyService(ReplyRepository replyRepository) {
		this.replyRepository = replyRepository;
	}

	public void doWriteReply(int loginedMemberId, String relTypeCode, int relId, String replybody) {
		replyRepository.doWriteReply(loginedMemberId, relTypeCode, relId, replybody);
	}

	public List<Reply> getReplies(String relTypeCode, int relId) {
		return replyRepository.getReplies(relTypeCode, relId);
	}


}