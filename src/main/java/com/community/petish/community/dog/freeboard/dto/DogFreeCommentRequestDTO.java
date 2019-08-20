package com.community.petish.community.dog.freeboard.dto;

import lombok.Data;

@Data
public class DogFreeCommentRequestDTO {
	private Long id; //댓글 번호
	private String content; //댓글 내용
	
	private Long post_id; //게시글 번호
	private Long user_id; //유저 아이디
}
