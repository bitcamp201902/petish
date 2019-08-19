package com.community.petish.community.mypet.post.dto.response;

import java.sql.Date;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class MypetPostDetailResponse {

	private Long postId;
	private String title;
	private String content;
	private String image;
	private Date createdDate;
	private Long userId;
	
}
