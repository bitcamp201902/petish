package com.community.petish.community.mypet.post.dto.response;

import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.AllArgsConstructor;
import lombok.Getter;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MypetPostSummary {

	private Long postId;
	private String image;
	private Long likeCount;
	private Long commentCount;
	
}
