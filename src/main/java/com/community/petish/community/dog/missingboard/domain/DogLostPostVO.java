package com.community.petish.community.dog.missingboard.domain;

import java.util.Date;

import lombok.Data;

/* 실종견 게시판 게시글 */
/*
CREATE TABLE dog_lost_post_tb (
	id NUMBER NOT NULL PRIMARY KEY,  게시글 번호 
	dog_name VARCHAR2(50) NOT NULL,  강아지 이름 
	dog_age NUMBER NOT NULL,  강아지 나이 
	dog_gender VARCHAR2(10) NOT NULL,  강아지 성별 
	dog_description VARCHAR2(1000) NOT NULL,  강이지 특징 
	dog_image VARCHAR2(1000) NOT NULL,  강아지 사진 
	dog_lost_date DATE NOT NULL,  실종 일시 
	phone_number VARCHAR2(50) NOT NULL,  연락처 
	dog_lost_address VARCHAR2(200) NOT NULL,  실종 장소 
	reward NUMBER NOT NULL,  사례금 
	view_count NUMBER NOT NULL,  조회수 
	create_date DATE NOT NULL,  게시글 등록 시간 
	updated_date DATE NOT NULL,  게시글 수정 시간 
	found NUMBER NOT NULL,  발견 
	deleted NUMBER NOT NULL,  삭제유무 
	region_id NUMBER NOT NULL REFERENCES region_tb (id),  지역 식별자 
	user_id NUMBER NOT NULL REFERENCES User_tb (id),  유저식별자 
	species_id NUMBER NOT NULL REFERENCES dog_species_tb (id)  강아지 종류 식별자 
);
*/
@Data
public class DogLostPostVO {
	
	private Long id; //게시글 번호

	private String dog_name; //강아지 이름
	private int dog_age; //강아지 나이
	private String dog_gender; //강아지 성별 
	private String dog_description; //강아지 특징
	private String dog_image; //강아지 사진
	
	private Date dog_lost_date; //실종 일시
	private String phone_number; //연락처
	private String dog_lost_address; //실종 장소
	private int reward; //사례금
}
