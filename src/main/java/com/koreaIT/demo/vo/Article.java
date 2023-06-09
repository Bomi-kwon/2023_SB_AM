package com.koreaIT.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Article {
	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private int boardId;
	private String title;
	private String body;
	private String writerName;
	private boolean actorCanChangeData;
	private int hit;
	private int replymemberId;
	private String replybody;
	private int replyCnt;
	
	private int sumReactionPoint;
	private int likeReactionPoint;
	private int hateReactionPoint;
	
	public String getForPrintBody() {
		
		return this.body.replaceAll("\n","<br/>" );
	}
	
}