package com.community.petish.community.mypage.service;

import com.community.petish.community.mypage.dto.request.MessageRequestDTO;
import com.community.petish.community.mypage.dto.response.Criteria;
import com.community.petish.community.mypage.dto.response.MessageResponseDTO;
import com.community.petish.community.mypage.dto.response.ReceivedMessagePageDTO;
import com.community.petish.community.mypage.dto.response.SentMessagePageDTO;

public interface MessageService {

	// 1. 쪽지 작성
	int writeMessage(MessageRequestDTO dto);

	// 2. 받은 쪽지 리스트 조회
	//public ArrayList<MessageResponseDTO> getReceivedMessageList(Long user_id);
	// 받은 쪽지 리스트 조회+페이징
	ReceivedMessagePageDTO getReceivedMessagePaging(Criteria cri);
//	ReceivedMessagePageDTO getReceivedMessagePagingWithSearch(Criteria cri);

		
	// 3. 보낸 쪽지 리스트 조회
	//public ArrayList<MessageResponseDTO> getSentMessageList(Long user_id);
	// 보낸 쪽지 리스트 조회+페이징
	SentMessagePageDTO getSentMessagePaging(Criteria cri);
	// 4. 받은 쪽지 상세조회
	MessageResponseDTO receivedMessageDetail(Long id);
	
	// 5. 보낸 쪽지 상세조회
	MessageResponseDTO sentMessageDetail(Long id);

	// 6. 쪽지 삭제
	int deleteMessage(Long id);
	
	// 7. 받은 메세지중 삭제안된 메세지 갯수
	int getUndeletedReceived(Long user_id);
	
	// 8. 보낸 메세지중 삭제안된 메세지 갯수
	int getUndeletedSent(Long user_id);
	
	// 9. 쪽지 읽음으로 변경
	int changeReadAttr(MessageRequestDTO dto);
	
	int checkNewMessage(Long user_id);
}
