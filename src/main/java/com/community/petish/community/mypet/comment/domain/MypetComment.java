package com.community.petish.community.mypet.comment.domain;

import java.sql.Date;

import lombok.Getter;

@Getter
public class MypetComment {

	private Long id;
	private String content;
	private Date created_date;
	private Date updated_date;
	private int deleted;
	private Long post_id;
	private Long user_id;
	
}
