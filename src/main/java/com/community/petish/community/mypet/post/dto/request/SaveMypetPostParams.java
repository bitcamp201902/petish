package com.community.petish.community.mypet.post.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class SaveMypetPostParams {

	private String title;
	private String content;
	private String images;
	private Long userId;
	
}
