package com.community.petish.community.mypage.dto.request;

import lombok.Data;

//message 사용자에게 입력받아 db에 저장할 때 쓰일 DTO
@Data
public class MessageRequestDTO {
	
	// 쪽지 제목
	String title;
	// 쪽지 내용
	String content;
	// 발신자
	Long sender_id;
	// 수신자
	Long receiver_id;
	// 쪽지 수신확인 => 수신자가 user_id인 메시지를 클릭했을 때 해당 데이터값이 1로 변동
	Integer read;
	// 쪽지 식별자
	Long id;

}
