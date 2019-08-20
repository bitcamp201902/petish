package com.community.petish.community.dog.freeboard.dto;

import lombok.Data;

@Data
public class DogFreePostRequestDTO {
	private Long id;
	private String title;
	private String content;	
	
	private Long user_id;
	private Long category_id;
}
