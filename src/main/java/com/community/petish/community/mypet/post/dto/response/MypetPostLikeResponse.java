package com.community.petish.community.mypet.post.dto.response;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class MypetPostLikeResponse {

	private Long id;
	private Long postId;
	private Long userId;
	
}
