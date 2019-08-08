package com.community.petish.mypage.dto.request;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserModifyPictureDTO_Mypage {
	
	Long id;
	String picture;
	
}
