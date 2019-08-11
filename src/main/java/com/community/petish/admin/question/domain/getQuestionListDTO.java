package com.community.petish.admin.question.domain;

import lombok.Data;

@Data
public class getQuestionListDTO {
	private Long id;
	private String category;
	private String title;
	private String content;
	private String nickname;
	private String created_date;
	private boolean replied;
}
