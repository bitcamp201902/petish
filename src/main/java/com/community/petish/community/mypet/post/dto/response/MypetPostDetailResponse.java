package com.community.petish.community.mypet.post.dto.response;

import java.sql.Date;

import com.community.petish.community.mypet.post.domain.MypetPost;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Getter
@NoArgsConstructor
public class MypetPostDetailResponse {

	private Long postId;
	private String title;
	private String content;
	private String image;
	private Date createdDate;
	private Long userId;

	private MypetPostDetailResponse(MypetPost mypetPost) {
		this.postId = mypetPost.getId();
		this.title = mypetPost.getTitle();
		this.content = mypetPost.getContent();
		this.image = mypetPost.getImage();
		this.createdDate = mypetPost.getCreated_date();
		this.userId = mypetPost.getUser_id();
	}

    public static MypetPostDetailResponse generatedByMypetPost(MypetPost mypetPost) {
    	return new MypetPostDetailResponse(mypetPost);
    }
}
