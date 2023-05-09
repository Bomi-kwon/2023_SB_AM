package com.koreaIT.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyRepository {

	@Insert("""
			INSERT INTO reply
			SET regDate = NOW(),
			updateDate = NOW(),
			replymemberId = #{loginedMemberId},
			relTypeCode = #{relTypeCode},
			relId = #{relId},
			replybody = #{replybody};
			""")
	void doWriteReply(int loginedMemberId, String relTypeCode, String relId, String replybody);

}