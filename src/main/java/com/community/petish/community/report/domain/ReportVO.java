package com.community.petish.community.report.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReportVO {
	private Long id; //신고 식별자
	
	private String description; //신고 내용
	private Date created_date; //신고 날짜
	private int deleted; //삭제 유무
	
	private Long category_id; //신고 카테고리 식별자
	private Long board_id; //게시판 식별자
	private Long post_id; //게시글 번호
	private Long user_id; //유저 식별자
}