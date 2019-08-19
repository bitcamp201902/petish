
package com.community.petish.community.mypage.service;


import com.community.petish.community.mypage.mapper.MessageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.community.mypage.dto.request.MessageRequestDTO;
import com.community.petish.community.mypage.dto.response.Criteria;
import com.community.petish.community.mypage.dto.response.MessageResponseDTO;
import com.community.petish.community.mypage.dto.response.ReceivedMessagePageDTO;
import com.community.petish.community.mypage.dto.response.SentMessagePageDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageMapper messageMapper;
	
	//1. 쪽지 작성
	@Override
	public int writeMessage(MessageRequestDTO dto) {
		int res = messageMapper.writeMessage(dto);
		return res;
	}

	//2. 받은 쪽지 리스트 조회
	@Override
	public ReceivedMessagePageDTO getReceivedMessagePaging(Criteria cri) {
		log.info("받은 쪽지 갯수"+messageMapper.getSentCnt(cri.getUser_id()));
		return new ReceivedMessagePageDTO(
				messageMapper.getReceivedCnt(cri.getUser_id()),
				messageMapper.getReceivedMessageWithPaging(cri));
	}

	//3. 보낸 쪽지 리스트 조회
	@Override
	public SentMessagePageDTO getSentMessagePaging(Criteria cri) {
		log.info("보낸 쪽지 갯수"+messageMapper.getSentCnt(cri.getUser_id()));
		return new SentMessagePageDTO(
				messageMapper.getSentCnt(cri.getUser_id()),
				messageMapper.getSentMessageWithPaging(cri));
	}

	//4. 받은 쪽지 상세조회
	@Override
	public MessageResponseDTO receivedMessageDetail(Long id) {
		
		MessageResponseDTO dto = messageMapper.receivedMessageDetail(id);
		return dto;
	}

	// 5. 보낸 쪽지 상세조회
	@Override
	public MessageResponseDTO sentMessageDetail(Long id) {
		
		MessageResponseDTO dto = messageMapper.sentMessageDetail(id);
		return dto;
	}
	
	//6. 쪽지 삭제
	@Override
	public int deleteMessage(Long id) {
		int res = messageMapper.deleteMessage(id);
		return res;
	}

	//7. 받은 메세지중 삭제안된 메세지 갯수
	@Override
	public int getUndeletedReceived(Long user_id) {
		int undeletedReceived = messageMapper.getUndeletedReceived(user_id);
		return undeletedReceived;
	}

	//8. 보낸 메세지중 삭제안된 메세지 갯수
	@Override
	public int getUndeletedSent(Long user_id) {
		int undeletedSent = messageMapper.getUndeletedSent(user_id);
		return undeletedSent;
	}

	//9. 쪽지 읽음으로 변경
	@Override
	public int changeReadAttr(MessageRequestDTO dto) {
	       int res = messageMapper.changeReadAttr(dto);
	       return res;
	}

	public int checkNewMessage(Long user_id) {
		int res = messageMapper.checkNewMessage(user_id);
		return res;
	}
}
