package com.community.petish.mypage.dto.response;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@Getter
@AllArgsConstructor
public class SentMessagePageDTO {
	
	private int sentCnt;
	private List<MessageResponseDTO> list;

}
