package com.community.petish.community.report.domain;

import lombok.Data;

@Data
public class ReportCategoryVO {
	private Long id; //신고 카테고리 식별자
	private String category_name; //신고 카테고리
}