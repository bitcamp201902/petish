package com.community.petish.community.mypet.comment.dto.response;

import java.util.List;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class MypetCommentListResponse {

	private List<MypetCommentDetailResponse> comments;
	
	public MypetCommentListResponse(List<MypetCommentDetailResponse> comments) {
		this.comments = comments;
	}
	
}
