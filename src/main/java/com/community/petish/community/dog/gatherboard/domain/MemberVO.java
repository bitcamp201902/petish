package com.community.petish.community.dog.gatherboard.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import oracle.sql.DATE;

@Getter
@Setter
@ToString
public class MemberVO {

	private Long id;
	private String username;
	private String password;
	private String nickname;
	private String address;
	private String gender;
	private String picture;
	private DATE join_date;
	private DATE updated_date;
	private int deleted;
	private int concern_id;
	
}
