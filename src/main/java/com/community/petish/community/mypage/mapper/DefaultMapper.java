package com.community.petish.community.mypage.mapper;

import java.util.ArrayList;

import com.community.petish.community.mypage.dto.response.Criteria;
import com.community.petish.community.mypage.dto.response.MyWritingsDTO;
import com.community.petish.community.mypage.dto.response.Writings_CommentedDTO;
import com.community.petish.community.mypage.dto.response.Writings_LikedDTO;

public interface DefaultMapper {

  ArrayList<MyWritingsDTO> getMyWritingsWithPaging(Criteria cri);
  int getWritingsCnt(Long user_id);
	
	ArrayList<Writings_CommentedDTO> getCommentedWithPaging(Criteria cri);
	int getCommentedCnt(Long user_id);
	
	ArrayList<Writings_LikedDTO> getLikedWithPaging(Criteria cri);
	int getLikedCnt(Long user_id);
	
}
