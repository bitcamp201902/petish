package com.community.petish.community.cat.gatherboard.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CatGatherCommentVO {
	private Long ID;
	private String CONTENT;
	private Date CREATED_DATE;
	private Date UPDATED_DATE;
	private int DELETED;
	private Long POST_ID;
	private Long USER_ID;
	
	public CatGatherCommentVO() {}
	
	public CatGatherCommentVO(Long ID, String CONTENT, Long POST_ID, Long USER_ID) {
		this.ID = ID;
		this.CONTENT = CONTENT;
		this.POST_ID = POST_ID;
		this.USER_ID = USER_ID;
	}
}
