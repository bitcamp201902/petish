package com.community.petish.admin.mapper;

import java.util.List;

import com.community.petish.admin.domain.getUserListDTO;
import com.community.petish.user.dto.UserResponseDTO_Mypage;

public interface AdminMapper {
	Long getUserCount();
	Long getMaleCount();
	Long getFemaleCount();
	Long getConcernCatCount();
	Long getConcernDogCount();
	Integer deleteUser(Long id);
	List<getUserListDTO> getUserList();
	UserResponseDTO_Mypage getUser(Long id);
}
