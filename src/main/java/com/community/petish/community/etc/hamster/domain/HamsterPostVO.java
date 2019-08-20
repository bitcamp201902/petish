package com.community.petish.community.etc.hamster.domain;

import java.util.Date;

import lombok.Data;
/*
CREATE TABLE hamster_post_tb (
    id NUMBER NOT NULL primary key,  게시글 번호 
	title VARCHAR2(100 CHAR) NOT NULL,  게시글 제목 
	content VARCHAR2(2500 CHAR) NOT NULL,  게시글 내용 
	created_date DATE NOT NULL,  생성일자 
	updated_date DATE NOT NULL,  최근수정일자 
	view_count NUMBER NOT NULL,  조회수 
	deleted NUMBER NOT NULL,  삭제유무 
    
    user_id NUMBER NOT NULL,  유저식별자 
	category_id NUMBER NOT NULL,  카테고리 식별자 
    
	foreign key (user_id) references user_tb(id),
	foreign key (category_id) references etc_category_tb(id)
);
*/

@Data
public class HamsterPostVO {
	private Long id;
	private String title;
	private String content;
	private Date created_date;
	private Date updated_date;
	private Integer view_count;
	private Integer deleted;

	private Long category_id;
	private Long user_id;
}
