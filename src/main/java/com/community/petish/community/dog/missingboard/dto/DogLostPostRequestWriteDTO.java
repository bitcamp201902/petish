package com.community.petish.community.dog.missingboard.dto;


import java.util.Date;
import java.util.List;

import com.community.petish.community.dog.missingboard.domain.AttachFileVO;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DogLostPostRequestWriteDTO {
	
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
	
	private int found; //발견
	
	private Long user_id; //유저 식별자
	private int species_id; //강아지 종류 식별자	
	
	private List<AttachFileVO> attachList; //이미지 업로드
	
}
