package com.community.petish.community.etc.hamster.mapper;

import java.util.List;

import com.community.petish.community.etc.hamster.dto.Criteria;
import com.community.petish.community.etc.hamster.dto.HamsterPostRequestDTO;
import com.community.petish.community.etc.hamster.dto.HamsterPostResponseDTO;

public interface HamsterPostMapper {
	// 게시글 수
	int getPostCount(Criteria cri);

	// 게시글 리스트
	List<HamsterPostResponseDTO> getPostList(Criteria cri);
	
	// 게시글 조회
	HamsterPostResponseDTO getPostDetail(Long id);

	// 게시글 조회 수 갱신
	int updateViewCount(Long id);
		
	// 게시글 작성
	int insertPost(HamsterPostRequestDTO dto);

	// 게시글 수정
	int updatePost(HamsterPostRequestDTO dto);

	// 게시글 삭제
	int deletePost(Long id);
}
