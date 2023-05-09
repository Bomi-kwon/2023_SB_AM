package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.koreaIT.demo.vo.Reply;

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
	void doWriteReply(int loginedMemberId, String relTypeCode, int relId, String replybody);

	
	@Select("""
			SELECT R.*, M.nickname AS writerName
			FROM reply AS R
			INNER JOIN `member` AS M
			ON R.replymemberId = M.id
			WHERE R.relTypeCode = #{relTypeCode}
			AND R.relId = #{relId}
			ORDER BY R.id DESC
			""")
	List<Reply> getReplies(String relTypeCode, int relId);

}