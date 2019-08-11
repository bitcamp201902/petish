package com.community.petish.community.mypet.post.dto.response;

import java.util.List;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class MypetPostLikeListResponse {

	private List<MypetPostLikeResponse> likes;
	
	public MypetPostLikeListResponse(List<MypetPostLikeResponse> likes) {
		this.likes = likes;
	}
}
