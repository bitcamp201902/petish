package com.community.petish.community.etc.hamster.dto;

import lombok.Data;

@Data
public class HamsterPostRequestDTO {
	private Long id;
	private String title;
	private String content;	
	
	private Long user_id;
	private Long category_id;
}
