package com.koreaIT.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.ReactionPointRepository;
import com.koreaIT.demo.vo.ReactionPoint;

@Service
public class ReactionPointService {

	private ReactionPointRepository reactionPointRepository;

	@Autowired
	public ReactionPointService(ReactionPointRepository reactionPointRepository) {
		this.reactionPointRepository = reactionPointRepository;
	}

	public ReactionPoint getReactionPoint(int loginedMemberId, int relId, String relTypeCode) {
		return reactionPointRepository.getReactionPoint(loginedMemberId, relId, relTypeCode);
	}

	public void doChangeReactionPoint(int loginedMemberId, String relTypeCode, int relId, int point) {
		reactionPointRepository.doChangeReactionPoint(loginedMemberId, relTypeCode, relId, point);
	}

	public void doDeleteReactionPoint(int loginedMemberId, String relTypeCode, int relId) {
		reactionPointRepository.doDeleteReactionPoint(loginedMemberId, relTypeCode, relId);
	}

	public int getMyLikesCnt(int loginedMemberId) {
		return reactionPointRepository.getMyLikesCnt(loginedMemberId);
	}


}