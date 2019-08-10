package com.community.petish.mypage.dto.response;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@Getter
@AllArgsConstructor
public class WritingPageDTO {

		private int writingsCnt;
		private List<MyWritingsDTO> list;

	
}
