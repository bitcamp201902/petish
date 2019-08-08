package com.community.petish.mypage.mapper;

import java.util.ArrayList;

import com.community.petish.mypage.dto.Criteria;
import com.community.petish.mypage.dto.MessageRequestDTO;
import com.community.petish.mypage.dto.MessageResponseDTO;

public interface MessageMapper {
	
	//1. 쪽지 작성
	public int writeMessage(MessageRequestDTO dto);
	
	//2. 받은 쪽지 리스트 조회
	//public ArrayList<MessageResponseDTO> getReceivedMessageList(Long user_id);
	// 받은 쪽지 리스트 조회+페이징
	public ArrayList<MessageResponseDTO> getReceivedMessageWithPaging(Criteria cri);
	// 받은 쪽지 전체 갯수 가져오기
	public int getReceivedCnt(Long user_id);
	
	//3. 보낸 쪽지 리스트 조회
	//public ArrayList<MessageResponseDTO> getSentMessageList(Long user_id);
	// 보낸 쪽지 리스트 조회+페이징
	public ArrayList<MessageResponseDTO> getSentMessageWithPaging(Criteria cri);
	// 보낸 쪽지 전체 갯수 가져오기
	public int getSentCnt(Long user_id);
	
	//4. 받은 쪽지 상세조회
	public MessageResponseDTO receivedMessageDetail(Long id);
	
	//5. 보낸 쪽지 상세조회
	public MessageResponseDTO sentMessageDetail(Long id);
	
	//6. 쪽지 삭제
	public int deleteMessage(Long id);
	
	//7. 받은 메세지중 삭제안된 메세지 갯수
	public int getUndeletedReceived(Long user_id);
	
	//8. 보낸 메세지중 삭제안된 메세지 갯수
	public int getUndeletedSent(Long user_id);
	
	//9. 쪽지 읽음으로 변경
	public int changeReadAttr(MessageRequestDTO dto);
}
