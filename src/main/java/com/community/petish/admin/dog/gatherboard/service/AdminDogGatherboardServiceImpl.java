package com.community.petish.admin.dog.gatherboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.admin.dog.gatherboard.dto.response.AdminDogGatherboardListDTO;
import com.community.petish.admin.dog.gatherboard.mapper.AdminDogGatherboardMapper;
import com.community.petish.community.dog.gatherboard.domain.Criteria;

@Service("adminDogGatherboardService")
public class AdminDogGatherboardServiceImpl implements AdminDogGatherboardService {

	@Autowired
	private AdminDogGatherboardMapper adminDogGatherboardMapper;
	
	@Override
	public List<AdminDogGatherboardListDTO> getListWithPaging(Criteria cri) {
		List<AdminDogGatherboardListDTO> dogGatherListDTO = adminDogGatherboardMapper.getListWithPaging(cri);
		return dogGatherListDTO;
	}

	@Override
	public int getDogGatherboardPostCount() {
		int dogGatherPostCount = adminDogGatherboardMapper.getDogGatherboardPostCount();
		return dogGatherPostCount;
	}

	@Override
	public int restoreDogGatherPost(Long postID) {
		int res = adminDogGatherboardMapper.restoreDogGatherPost(postID);
		return res;
	}

}
