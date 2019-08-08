package com.community.petish.report.dto;

import lombok.Data;

@Data
public class ReportRequestDTO {
	
	private Long user_id; //유저 아이디
	private String description; //신고 내용
	private Long category_id; //신고 카테고리 식별자
	
	private Long board_id; //게시판 번호
	private Long post_id; //게시글 번호
	
}