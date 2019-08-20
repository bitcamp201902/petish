package com.community.petish.admin.user.service;

import java.util.List;

import com.community.petish.admin.user.domain.getUserListDTO;
import com.community.petish.community.mypage.dto.request.UserModifyRequestDTO_Mypage;
import com.community.petish.community.mypage.dto.response.UserResponseDTO_Mypage;

public interface AdminService {
	Long getUserCount();
	Long getTodayJoinedUserCount();
	Long getMaleCount();
	Long getFemaleCount();
	Long getConcernCatCount();
	Long getConcernDogCount();
	boolean deleteUser(Long id);
	List<getUserListDTO> getUserList();
	UserResponseDTO_Mypage getUser(Long id);
	
	Integer modifyUser(UserModifyRequestDTO_Mypage modifyUser);
}
