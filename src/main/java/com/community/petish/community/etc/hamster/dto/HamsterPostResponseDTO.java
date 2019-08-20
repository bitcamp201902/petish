package com.community.petish.community.etc.hamster.dto;

import java.util.Date;

import lombok.Data;

@Data
public class HamsterPostResponseDTO {
	private Long id;
	private String title;
	private String content;
	private Date created_date;
	private Date updated_date;
	private Integer view_count;
	
	private Long category_id;
	private String category_name;
	
	private Long user_id;
	private String nickname;
	
	private int commentCount; //댓글 갯수
}