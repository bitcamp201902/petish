package com.community.petish.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.mypage.mapper.UserMapper;
import com.community.petish.user.dto.UserModifyPictureDTO;
import com.community.petish.user.dto.UserModifyRequestDTO;
import com.community.petish.user.dto.UserResponseDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper mapper;
	
	//아이디로 회원정보 가져오는 메서드
	@Override
	public UserResponseDTO findUser(long id) {
		UserResponseDTO dto = mapper.findUser(id);
		return dto;
	}

	//비밀번호 포함한 회원정보 변경하는 메서드
	@Override
	public int modifyUserInfoAll(UserModifyRequestDTO dto) {
		int res = mapper.modifyUserInfoAll(dto);
		return res;
	}
	
	//비밀번호 제외한 회원정보 변경하는 메서드
	@Override
	public int modifyUserInfo(UserModifyRequestDTO dto) {
		int res = mapper.modifyUserInfo(dto);
		return res;
	}

	//프로필사진 수정
	@Override
	public int modifyPicture(UserModifyPictureDTO dto) {
		int res = mapper.modifyPicture(dto);
		return res;
	}
	

}
