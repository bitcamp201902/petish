package com.community.petish.community.mypet.comment.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class SaveMypetCommentParams {

	private String content;
	private Long postId;
	private Long userId;
	
}
