package com.community.petish.mypage.service;

import java.util.ArrayList;
import java.util.Map;

import com.community.petish.mypage.dto.MessageRequestDTO;
import com.community.petish.mypage.dto.MessageResponseDTO;

public interface MessageService {

	// 1. 쪽지 작성
	public int writeMessage(MessageRequestDTO dto);

	// 2. 받은 쪽지 리스트 조회
	public ArrayList<MessageResponseDTO> getReceivedMessageList(int user_id);

	// 3. 보낸 쪽지 리스트 조회
	public ArrayList<MessageResponseDTO> getSentMessageList(int user_id);

	// 4. 받은 쪽지 상세조회
	public MessageResponseDTO receivedMessageDetail(int id);
	
	// 5. 보낸 쪽지 상세조회
	public MessageResponseDTO sentMessageDetail(int id);

	// 6. 쪽지 삭제
	public int deleteMessage(int id);
	
	// 7. 받은 메세지중 삭제안된 메세지 갯수
	public int getUndeletedReceived(int user_id);
	
	// 8. 보낸 메세지중 삭제안된 메세지 갯수
	public int getUndeletedSent(int user_id);
	
	// 9. 쪽지 읽음으로 변경
	public int changeReadAttr(MessageRequestDTO dto);
	
}
