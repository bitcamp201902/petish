package com.community.petish.community.cat.infoboard.domain;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum;
	private int amount;
	
	private String searchType;
	private String searchKeyword;
	private int categoryId;
	


	public Criteria()	{
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	

	public String[] getSearchTypeArr() {
		return searchType == null? new String[] {}: searchType.split("");				
	}
	
//	public String[] getCategorytypeArr() {
//		return categorytype == null? new String[] {}: categorytype.split("");				
//	}
}
