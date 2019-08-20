package com.community.petish.community.dog.freeboard.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
CREATE TABLE dog_free_comment_tb (
	id NUMBER NOT NULL primary key,  댓글 번호 
	content VARCHAR2(200 CHAR) NOT NULL,  댓글 내용 
	created_date DATE NOT NULL,  등록 시간 
	updated_date DATE NOT NULL,  최근 수정 시간 
	deleted NUMBER NOT NULL,  삭제유무 
	post_id NUMBER NOT NULL,  게시글 번호 
	user_id NUMBER NOT NULL,  유저식별자 
	foreign key (user_id) references user_tb(id),
	foreign key (post_id) references dog_free_post_tb(id)
);
*/

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DogFreeCommentVO {
	private Long id; // 댓글 번호
	private String content; // 댓글 내용
	private Date created_date; // 등록 시간
	private Date updated_date; // 최근 수정 시간
	private int deleted; // 삭제 유무
	private Long post_id; // 게시글 번호
	private Long user_id; // 유저 식별자
}