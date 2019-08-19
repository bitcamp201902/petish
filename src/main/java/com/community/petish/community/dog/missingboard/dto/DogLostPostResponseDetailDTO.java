package com.community.petish.community.dog.missingboard.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DogLostPostResponseDetailDTO {

	private Long id; //게시글 번호

	private String dog_name; //강아지 이름
	private int dog_age; //강아지 나이
	private String dog_gender; //강아지 성별 
	private String dog_description; //강아지 특징
	private String dog_image; //강아지 사진
	
	@JsonFormat(pattern="yyyy/MM/dd HH:mm")
	private Date dog_lost_date; //실종 일시
	private String phone_number; //연락처
	private String dog_lost_address; //실종 장소
	private int reward; //사례금
	
	private int view_count; //조회수

	private Date create_date; //게시글 등록 시간
	private Date updated_date; //게시글 수정 시간
	
	private int found; //발견

	//private int REGION_ID; //지역 식별자
	private Long user_id; //유저 식별자
	private String nickname; //유저 닉네임
	
	private Long species_id; //강아지 종 식별자
	private String dog_species; //강아지 종류 이름	
	
}
