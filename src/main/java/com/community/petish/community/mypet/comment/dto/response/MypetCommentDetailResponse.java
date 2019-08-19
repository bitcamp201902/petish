package com.community.petish.community.mypet.comment.dto.response;

import java.sql.Date;

import com.community.petish.community.mypet.comment.domain.MypetComment;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Getter
@NoArgsConstructor
public class MypetCommentDetailResponse {

	private Long commentId;
	private String content;
	private Date createdDate;
	private Date updatedDate;
	
	private Long postId;
	private Long userId;
	
	public MypetCommentDetailResponse(MypetComment comment) {
		this.commentId = comment.getId();
		this.content = comment.getContent();
		this.createdDate = comment.getCreated_date();
		this.updatedDate = comment.getUpdated_date();
		this.postId = comment.getPost_id();
		this.userId = comment.getUser_id();
	}
	
}
