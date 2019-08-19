package com.community.petish.community.dog.missingboard.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class DogLostPostResponseListDTO {
	
	private Long id; //게시글 번호

	private int dog_age; //강아지 나이
	private String dog_gender; //강아지 성별 
	private String dog_image; //강아지 사진
	
	@JsonFormat(pattern="yyyy/MM/dd HH:mm")
	private String dog_lost_address; //실종 장소
	
	private int view_count; //조회수
	
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date create_date; //게시글 등록 시간
	@DateTimeFormat(pattern = "yyyy/MM/dd")	
	private Date updated_date; //게시글 수정 시간
	private int found; //발견
	
	private Long user_id; //유저 아이디
	private String nickname; //유저 닉네임
	private String dog_species; //강아지 종
	private int commentCount; //댓글 갯수
}
