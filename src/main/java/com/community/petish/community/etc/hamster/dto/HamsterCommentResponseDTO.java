package com.community.petish.community.etc.hamster.dto;


import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HamsterCommentResponseDTO {
	
	private Long id; //댓글 번호
	private String content; //댓글 내용
	@JsonFormat(pattern="yyyy.MM.dd HH:mm")
	private Date created_date; //등록 날짜
	@JsonFormat(pattern="yyyy.MM.dd HH:mm")
	private Date updated_date; //수정 날짜
	private int deleted;
	
	private Long post_id; //게시글 번호 
	private Long user_id; //유저 아이디
	private String nickname; //유저 닉네임
	
	private int count; //댓글 갯수
	
}
