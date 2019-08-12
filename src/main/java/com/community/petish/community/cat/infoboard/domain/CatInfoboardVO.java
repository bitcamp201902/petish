package com.community.petish.community.cat.infoboard.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CatInfoboardVO {

	private int ID;
	private String TITLE;
	private String CONTENT;
	private Date CREATE_DATE;
	private Date UPDATED_DATE;
	private int VIEW_COUNT;
	private int DELETED;
	private	int CATEGORY_ID;
	private int USER_ID;
	
}
