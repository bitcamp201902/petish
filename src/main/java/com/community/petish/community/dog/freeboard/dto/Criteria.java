package com.community.petish.community.dog.freeboard.dto;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class Criteria {
	private int pageNum; //페이지 번호
	private int amount; //한 페이지 당 데이터 갯수
	
	private String type; //검색 조건(제목, 작성자, 내용)
	private String keyword; //검색 키워드
	
	//생성자
	public Criteria() {
		this(1, 10);
	}
	
	//생성자
	public Criteria(int pageNum, int amount) { 
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}:type.split("");
	}
	
	public String getListLink() {
		//UrlComponentsBuilder : 브라우저에서 GET 방식 등의 파라미터 전송에 사용되는 문자열을 쉽게 처리할 수 있는 클래스
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			.queryParam("pageNum", this.pageNum)
			.queryParam("amount", this.getAmount())
			.queryParam("type", this.getType())
			.queryParam("keyword", this.getKeyword());		
		return builder.toUriString();
	}
	
}
