package com.community.petish.report.domain;

import lombok.Data;

@Data
public class BoardNameVO {
	private Long id; //게시판 식별자
	private String board_table_name; //테이블 이름
}