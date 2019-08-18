package com.community.petish.community.cat.infoboard.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CatInfoCommentPageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria criComment;
	
	public CatInfoCommentPageDTO(Criteria criComment, int total) {
		
		this.criComment = criComment;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(criComment.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / criComment.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
