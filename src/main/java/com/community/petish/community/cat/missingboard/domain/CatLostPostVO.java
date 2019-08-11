package com.community.petish.community.cat.missingboard.domain;

import java.util.Date;

/* 실종묘 게시판 게시글 */
/*
CREATE TABLE cat_lost_post_tb (
	id NUMBER NOT NULL PRIMARY KEY,  게시글 번호 
	cat_name VARCHAR2(50) NOT NULL,  고양이 이름 
	cat_age NUMBER NOT NULL,  고양이 나이 
	cat_gender VARCHAR(10) NOT NULL,  고양이 성별 
	cat_description VARCHAR(1000) NOT NULL,  고양이 특징 
	cat_image VARCHAR(1000) NOT NULL,  고양이 사진 
	cat_lost_date DATE NOT NULL,  실종 일시 
	phone_number VARCHAR2(50) NOT NULL,  연락처 
	cat_lost_address VARCHAR2(200) NOT NULL,  실종 장소 
	reward NUMBER NOT NULL,  사례금 
	view_count NUMBER NOT NULL,  조회수 
	create_date DATE NOT NULL,  게시글 등록 시간 
	updated_date DATE NOT NULL,  게시글 수정 시간 
	found NUMBER NOT NULL,  발견 
	deleted NUMBER NOT NULL,  삭제유무 
	region_id NUMBER NOT NULL,  지역 식별자 
	user_id NUMBER NOT NULL,  유저식별자 
	species_id NUMBER NOT NULL  고양이 종류 식별자 
);
*/

public class CatLostPostVO {
	
	private String id;

	private String cat_name;
	private int cat_age;
	private String cat_gender;
	private String cat_descrption;
	private String cat_image;
	private Date cat_lost_date;
	private String phone_number;
	private String cat_lost_address;
	private int reward;
	private int view_count;
	private Date create_date;
	private Date updated_date;
	private int found;
	private int deleted;

	private int region_id;
	private int user_id;
	private int specied_id;
	
}
