package com.community.petish.mypage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.mypage.dto.MyWritingsDTO;
import com.community.petish.mypage.dto.Writings_CommentedDTO;
import com.community.petish.mypage.dto.Writings_LikedDTO;
import com.community.petish.mypage.mapper.DefaultMapper;

@Service
public class DefaultServiceImpl implements DefaultService{

	@Autowired
	DefaultMapper mapper;
	
	@Override
	public ArrayList<MyWritingsDTO> getMyWritings(long user_id) {
		ArrayList list = mapper.getMyWritings(user_id);
		return list;
	}

	@Override
	public ArrayList<Writings_CommentedDTO> getCommented(long user_id) {
		ArrayList list = mapper.getCommented(user_id);
		return list;
	}

	@Override
	public ArrayList<Writings_LikedDTO> getLiked(long user_id) {
		ArrayList list = mapper.getLiked(user_id);
		return list;
	}

}
