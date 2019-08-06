package com.community.petish.dog.missingboard.domain;

import lombok.Data;

@Data
public class SendMessageVO {
	private String title; //쪽지 제목
	private String content; //쪽지 내용
	
	Long sender_id; //발신자
	Long receiver_id; //수신자
}
