package com.community.petish.community.mypet.post.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MypetPostListCriteria {

	private Integer pageNum;
	private String hashtag;
	private Integer amount = 20;
	
}
