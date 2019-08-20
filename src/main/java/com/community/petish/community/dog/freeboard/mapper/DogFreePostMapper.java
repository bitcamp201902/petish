package com.community.petish.community.dog.freeboard.mapper;

import java.util.List;

import com.community.petish.community.dog.freeboard.dto.Criteria;
import com.community.petish.community.dog.freeboard.dto.DogFreePostRequestDTO;
import com.community.petish.community.dog.freeboard.dto.DogFreePostResponseDTO;

public interface DogFreePostMapper {
	// 게시글 수
	int getPostCount(Criteria cri);

	// 게시글 리스트
	List<DogFreePostResponseDTO> getPostList(Criteria cri);
	
	// 게시글 조회
	DogFreePostResponseDTO getPostDetail(Long id);

	// 게시글 조회 수 갱신
	int updateViewCount(Long id);
		
	// 게시글 작성
	int insertPost(DogFreePostRequestDTO dto);

	// 게시글 수정
	int updatePost(DogFreePostRequestDTO dto);

	// 게시글 삭제
	int deletePost(Long id);
}
