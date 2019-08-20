package com.community.petish.community.mypet.post.domain;

import java.sql.Date;

import lombok.Getter;

@Getter
public class MypetPost {

	private Long id;
	private String title;
	private String content;
	private String image;
	private Date created_date;
	private Date updated_date;

	private Long user_id;
	
}
