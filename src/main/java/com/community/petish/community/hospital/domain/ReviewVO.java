package com.community.petish.community.hospital.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReviewVO {
	private Long id;
	private String content;
	private int score;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date create_date;
	private int deleted;
	private Long user_id;
	private Long hospital_id;
}
