package com.community.petish.community.report.dto;

import java.util.Date;

public class ReportResponseDTO {
	
	private Long ID; //신고 식별자
	
	private String description; //신고 내용
	private Date created_date; //신고 날짜
	private String category_name; //신고 카테고리명
	
	private Long post_id; //게시글 번호
	private String board_table_name; //게시판 이름
	private Long user_id; //유저 식별자
	private String nickname; //유저 닉네임	
}
