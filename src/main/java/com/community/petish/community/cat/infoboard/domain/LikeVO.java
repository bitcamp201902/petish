package com.community.petish.community.cat.infoboard.domain;

import lombok.Data;

@Data
public class LikeVO {

	private long ID;
	private int DISLIKE_LIKE;
	private int DELETED;
	private int COMMENT_ID;
	private int USER_ID;
	
}
