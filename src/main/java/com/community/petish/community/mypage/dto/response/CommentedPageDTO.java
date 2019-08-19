
package com.community.petish.community.mypage.dto.response;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@Getter
@AllArgsConstructor
public class CommentedPageDTO {

	private int commentedCnt;
	private List<Writings_CommentedDTO> list;
}
