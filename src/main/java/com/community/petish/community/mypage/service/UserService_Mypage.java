package com.community.petish.community.mypage.service;

import com.community.petish.community.mypage.dto.request.UserModifyPictureDTO_Mypage;
import com.community.petish.community.mypage.dto.request.UserModifyRequestDTO_Mypage;
import com.community.petish.community.mypage.dto.response.UserResponseDTO_Mypage;

public interface UserService_Mypage {
	UserResponseDTO_Mypage findUser(long id);
	
	int modifyUserInfoAll(UserModifyRequestDTO_Mypage dto);
	
	int modifyUserInfo(UserModifyRequestDTO_Mypage dto);
	
	int modifyPicture(UserModifyPictureDTO_Mypage dto);
	
}
