package com.community.petish.community.hospital.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next, isReview;
	private int realEnd;
	private int total;
	private Criteria cri;
	
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total =total;
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 5.0))*5;
		this.startPage =this.endPage -4;
		this.realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		if(this.realEnd < this.endPage) {
			this.endPage = this.realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < this.realEnd;
	}
	
	public PageDTO(Criteria cri, int total, boolean isReview) {
		this.cri = cri;
		this.total =total;
		this.isReview=isReview;
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0))*10;
		this.startPage =this.endPage -9;
		this.realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		if(this.realEnd < this.endPage) {
			this.endPage = this.realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < this.realEnd;
	}
	
}
