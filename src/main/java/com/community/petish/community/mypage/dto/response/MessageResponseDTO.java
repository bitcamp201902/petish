package com.community.petish.community.mypage.dto.response;

import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

//db에서 가져온 message(수신,발신) 조회할 때 쓰일 DTO
@Data
public class MessageResponseDTO {
	
	//쪽지식별자(쪽지번호, 개인별 x,전체o)
	Long id;
	// 쪽지 제목
	String title;
	// 쪽지 내용
	String content;
	// 쪽지 보낸날짜
	@JsonFormat(pattern="yyyy/MM/dd")
	Date sent_date;
	// 쪽지 수신확인 => 수신자가 user_id인 메시지를 클릭했을 때 해당 데이터값이 1로 변동
	int read;
	// 쪽지 삭제유무
	int deleted;
	// 발신자
	Long sender_id;
	// 수신자
	Long receiver_id;
	// 닉네임
	String nickname;
	
	int newMessage;
}
