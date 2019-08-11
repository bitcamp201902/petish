package com.community.petish.community.mypet.post.domain;

import java.sql.Date;

import lombok.Getter;

@Getter
public class MypetPost {

	private Long id;
	private String title;
	private String content;
	private String image;
	private Date createdDate;

	private Long userId;
	
}
