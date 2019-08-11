package com.community.petish.community.user.service;

import javax.servlet.http.HttpSession;

import com.community.petish.community.user.domain.User;
import com.community.petish.community.user.dto.request.LoginUserParams;
import com.community.petish.community.user.dto.request.SaveUserParams;
import com.community.petish.community.user.dto.response.UserDetailResponse;
import com.community.petish.community.user.dto.response.UserListResponse;

public interface UserService {

	Long saveUser(SaveUserParams saveUserParams);
		
	UserListResponse getUsers();
	
	UserDetailResponse getUser(Long userId);
	
	Boolean checkNicknameDuplication(String nickname);

	User findById(Long id);
	
	void login(LoginUserParams loginUserParams, HttpSession session);
	
	void logout(HttpSession session);

    void sendCertificateNumber(String username, HttpSession session);

    Boolean checkCertificateNumber(String username, String certificateNumber, HttpSession session);
}
