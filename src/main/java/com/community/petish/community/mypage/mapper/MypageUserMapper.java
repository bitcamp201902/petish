package com.community.petish.community.mypage.mapper;

import com.community.petish.community.mypage.dto.request.UserModifyPictureDTO_Mypage;
import com.community.petish.community.mypage.dto.request.UserModifyRequestDTO_Mypage;
import com.community.petish.community.mypage.dto.response.UserResponseDTO_Mypage;

public interface MypageUserMapper {
	UserResponseDTO_Mypage findUser(long id);
	
	int modifyUserInfoAll(UserModifyRequestDTO_Mypage dto);
	
	int modifyUserInfo(UserModifyRequestDTO_Mypage dto);
	
	int modifyPicture(UserModifyPictureDTO_Mypage dto);
}
