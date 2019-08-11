package com.community.petish.community.dog.missingboard.dto;

import lombok.Data;

@Data
public class DogLostCommentRequestDTO {
	private Long id; //댓글 번호
	private String content; //댓글 내용
	
	private Long post_id; //게시글 번호
	private Long user_id; //유저 아이디
}
