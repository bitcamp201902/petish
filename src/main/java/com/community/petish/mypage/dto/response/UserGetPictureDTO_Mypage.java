package com.community.petish.mypage.dto.response;

import lombok.Data;

@Data
public class UserGetPictureDTO_Mypage {
	//프로필사진 이름
	private String picture;
	
	//유저 id
	private Long id;
	
	//업로드 경로
	private String uploadPath;
	
	//이미지여부
	private boolean isEmpty;
}
