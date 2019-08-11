package com.community.petish.community.mypage.mapper;

import java.util.ArrayList;

import com.community.petish.community.mypage.dto.request.MessageRequestDTO;
import com.community.petish.community.mypage.dto.response.Criteria;
import com.community.petish.community.mypage.dto.response.MessageResponseDTO;

public interface MessageMapper {
	
	int writeMessage(MessageRequestDTO dto);

	ArrayList<MessageResponseDTO> getReceivedMessageWithPaging(Criteria cri);

	int getReceivedCnt(Long user_id);
	
	ArrayList<MessageResponseDTO> getSentMessageWithPaging(Criteria cri);

	int getSentCnt(Long user_id);
	
	MessageResponseDTO receivedMessageDetail(Long id);
	
	MessageResponseDTO sentMessageDetail(Long id);
	
	int deleteMessage(Long id);
	
	int getUndeletedReceived(Long user_id);
	
	int getUndeletedSent(Long user_id);
	
	int changeReadAttr(MessageRequestDTO dto);

	int checkNewMessage(Long user_id);
}
