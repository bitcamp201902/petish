package com.community.petish.mypage.dto.response;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@Getter
@AllArgsConstructor
public class ReceivedMessagePageDTO {

	private int receivedCnt;
	private List<MessageResponseDTO> list;
	
}
