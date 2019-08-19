package com.community.petish.community.dog.missingboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.petish.community.dog.missingboard.dto.Criteria;
import com.community.petish.community.dog.missingboard.dto.DogLostPostRequestWriteDTO;
import com.community.petish.community.dog.missingboard.dto.DogLostPostResponseDetailDTO;
import com.community.petish.community.dog.missingboard.dto.DogLostPostResponseListDTO;


public interface DogLostPostMapper {
	
	//게시글 수
	int getPostCount(Criteria cri);
	
	//게시글 리스트
	List<DogLostPostResponseListDTO> getDogLostList(Criteria cri);
	
	//게시글 조회
	DogLostPostResponseDetailDTO getPostDetail(Long id);
	
	//게시글 조회 수 갱신
	int updateViewCount(Long id);
	
	//게시글  작성
	int insertPost(DogLostPostRequestWriteDTO dto);	
	
	//게시글 수정
	int updatePost(DogLostPostRequestWriteDTO dto);
	
	//게시글 삭제
	int deletePost(Long id);
	
	//쪽지 전송(파라미터 : 게시글 아이디)
	int sendMessage(@Param("id") Long id,  @Param("content") String content, @Param("senderId") Long senderId);
}
