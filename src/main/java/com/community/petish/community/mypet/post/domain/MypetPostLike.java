package com.community.petish.community.mypet.post.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MypetPostLike {

	private Long id;
	private Integer deleted;
	private Long post_id;
	private Long user_id;

}
