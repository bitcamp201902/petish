package com.community.petish.community.mypage.dto.response;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@Getter
@AllArgsConstructor
public class LikedPageDTO {

	private int likedCnt;
	private List<Writings_LikedDTO> list;
}
