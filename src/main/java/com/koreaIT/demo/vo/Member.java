package com.koreaIT.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int id;
	private String regDate;
	private String updateDate;
	private String loginID;
	private String loginPW;
	private int authLevel;
	private String name; // 소셜에서 제공받은 유저명 => 유저 닉네임
	private String nickname; 
	private String cellphoneNum;
	private String email; // 소셜에서 제공받은 이메일
	private int delStatus;
	private String delDate;
	private String provider; // 소셜 제공자 -> ex) 네이버, 카카오 ----
}
