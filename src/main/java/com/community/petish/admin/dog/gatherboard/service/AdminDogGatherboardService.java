package com.community.petish.admin.dog.gatherboard.service;

import java.util.List;

import com.community.petish.admin.dog.gatherboard.dto.response.AdminDogGatherboardListDTO;
import com.community.petish.community.dog.gatherboard.domain.Criteria;

public interface AdminDogGatherboardService {

	public List<AdminDogGatherboardListDTO> getListWithPaging(Criteria cri);
	public int getDogGatherboardPostCount();
	public int restoreDogGatherPost(Long postID);

}
