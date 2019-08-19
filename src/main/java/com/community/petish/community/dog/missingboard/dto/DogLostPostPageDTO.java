package com.community.petish.community.dog.missingboard.dto;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class DogLostPostPageDTO {
	
	private int startPage; //시작 페이지
	private int endPage; //끝 페이지
	private boolean prev, next;
	
	private int total; //전체 페이지
	private Criteria cri; //(amount, pageNum)현재 페이지
	
	//생성자
	public DogLostPostPageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total*1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;				
	}
	
}
