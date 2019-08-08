package com.community.petish.mypage.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MessageVO {
	//쪽지식별자(쪽지번호, 개인별 x,전체o)
	int id;
	
	//쪽지 제목
	String title;
	
	//쪽지 내용
	String content;
	
	//쪽지 보낸날짜
	Date sent_date;
	
	//쪽지 수신확인 => 수신자가 user_id인 메시지를 클릭했을 때 해당 데이터값이 1로 변동
	int read;
	
	//쪽지 삭제유무
	int deleted;
	
	//발신자
	int sender_id;
	
	//수신자
	int receiver_id;
}
