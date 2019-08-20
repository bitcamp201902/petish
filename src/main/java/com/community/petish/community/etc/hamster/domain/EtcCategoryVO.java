package com.community.petish.community.etc.hamster.domain;

import lombok.Data;

/*
CREATE TABLE etc_category_tb (
	id NUMBER NOT NULL,  카테고리 식별자 
	category_name VARCHAR2(50 CHAR) NOT NULL  종류 
);
*/

@Data
public class EtcCategoryVO {
	private Long id; // 카테고리 식별자
	private String category_name; // 카테고리 이름
}