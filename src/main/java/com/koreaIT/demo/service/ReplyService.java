package com.koreaIT.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.ReplyRepository;

@Service
public class ReplyService {

	private ReplyRepository replyRepository;

	@Autowired
	public ReplyService(ReplyRepository replyRepository) {
		this.replyRepository = replyRepository;
	}

	public void doWriteReply(int loginedMemberId, String relTypeCode, String relId, String replybody) {
		replyRepository.doWriteReply(loginedMemberId, relTypeCode, relId, replybody);
	}


}