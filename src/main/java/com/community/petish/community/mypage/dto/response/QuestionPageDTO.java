package com.community.petish.community.mypage.dto.response;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@Getter
@AllArgsConstructor
public class QuestionPageDTO {

	private int questionCnt;
	private List<QuestionResponseDTO> list;
	
}
