package com.community.petish.community.mypet.post.dto.response;

import java.util.List;

import com.community.petish.community.mypet.post.dto.request.MypetPostListCriteria;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class MypetPostSummaryList {

	private MypetPostListCriteria mypetPostListCriteria;
	private Integer lastPage;
	private List<MypetPostSummary> posts;
	
	public MypetPostSummaryList(MypetPostListCriteria mypetPostListCriteria, Integer lastPage, List<MypetPostSummary> posts) {
		this.mypetPostListCriteria = mypetPostListCriteria;
		this.lastPage = lastPage;
		this.posts = posts;
	}
	
}
