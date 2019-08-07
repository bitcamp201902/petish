package com.community.petish.admin.service;

import java.util.List;

import com.community.petish.admin.domain.getUserListDTO;
import com.community.petish.user.dto.UserResponseDTO_Mypage;

public interface AdminService {
	Long getUserCount();
	Long getMaleCount();
	Long getFemaleCount();
	Long getConcernCatCount();
	Long getConcernDogCount();
	boolean deleteUser(Long id);
	List<getUserListDTO> getUserList();
	UserResponseDTO_Mypage getUser(Long id);
}
