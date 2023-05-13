package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	public void doWriteReply(int loginedMemberId, String relTypeCode, int relId, String replybody);

	
	@Select("""
			SELECT R.*, M.nickname AS writerName
			FROM reply AS R
			INNER JOIN `member` AS M
			ON R.replymemberId = M.id
			WHERE R.relTypeCode = #{relTypeCode}
			AND R.relId = #{relId}
			""")
	public List<Reply> getReplies(String relTypeCode, int relId);


	@Delete("""
			DELETE FROM reply
			WHERE id = #{id}
			""")
	public void doDeleteReply(int id);


	@Select("""
			SELECT R.*, M.nickname AS writerName
			FROM reply AS R
			INNER JOIN `member` AS M
			ON R.replymemberId = M.id
			WHERE R.id = #{id}
			""")
	public Reply getReply(int id);


	@Update("""
			UPDATE reply
			SET updateDate = NOW(),
			replybody = #{replybody}
			WHERE id = #{id}
			""")
	public void doModifyReply(int id, String replybody);
	
	

}