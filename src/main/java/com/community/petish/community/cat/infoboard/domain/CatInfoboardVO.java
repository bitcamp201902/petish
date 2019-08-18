package com.community.petish.community.cat.infoboard.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CatInfoboardVO {

	private Long ID; //게시글 번호
	private String TITLE; //게시글 제목
	private String CONTENT; //게시글 내용 
	private Date CREATE_DATE; //작성 시간
	private Date UPDATED_DATE; //최근 수정시간
	private int VIEW_COUNT; //조회수
	private int DELETED; //삭제유무
	private	int CATEGORY_ID; //정보 식별자
	private Long USER_ID; //유저식별자
	
}
