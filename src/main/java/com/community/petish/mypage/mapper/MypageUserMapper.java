package com.community.petish.mypage.mapper;

import com.community.petish.mypage.dto.request.UserModifyPictureDTO_Mypage;
import com.community.petish.mypage.dto.request.UserModifyRequestDTO_Mypage;
import com.community.petish.mypage.dto.response.UserResponseDTO_Mypage;

public interface MypageUserMapper {
	//아이디로 회원정보 가져오기
	public UserResponseDTO_Mypage findUser(long id);
	
	//비밀번호 포함한 회원정보 수정
	public int modifyUserInfoAll(UserModifyRequestDTO_Mypage dto);
	
	//비밀번호 제외한 회원정보
	public int modifyUserInfo(UserModifyRequestDTO_Mypage dto);
	
	//프로필사진 수정
	public int modifyPicture(UserModifyPictureDTO_Mypage dto);
}
