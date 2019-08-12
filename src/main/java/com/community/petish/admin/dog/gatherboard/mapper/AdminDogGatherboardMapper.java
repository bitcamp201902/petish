package com.community.petish.admin.dog.gatherboard.mapper;

import java.util.List;

import com.community.petish.admin.dog.gatherboard.dto.response.AdminDogGatherboardListDTO;
import com.community.petish.community.dog.gatherboard.domain.Criteria;

public interface AdminDogGatherboardMapper {

	List<AdminDogGatherboardListDTO> getListWithPaging(Criteria cri);
	int getDogGatherboardPostCount();
	int restoreDogGatherPost(Long postID);
}
