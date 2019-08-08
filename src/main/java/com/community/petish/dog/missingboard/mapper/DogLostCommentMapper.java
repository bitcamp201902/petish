package com.community.petish.dog.missingboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.petish.dog.missingboard.dto.CommentCriteria;
import com.community.petish.dog.missingboard.dto.DogLostCommentRequestDTO;
import com.community.petish.dog.missingboard.dto.DogLostCommentResponseDTO;

public interface DogLostCommentMapper {	
	//댓글 입력
	int insertComment(DogLostCommentRequestDTO requestDTO);
	
	//댓글 조회
	DogLostCommentResponseDTO getComment(Long commentID);
	
	//댓글 리스트 조회
	List<DogLostCommentResponseDTO> getCommentList(@Param("cri") CommentCriteria cri, @Param("post_id") Long postID);
	
	//댓글 수 조회
	int getCommentCount(Long postID);
	
	//댓글 수정
	int modifyComment(DogLostCommentRequestDTO requestDTO);
	
	//댓글 삭제
	int removeComment(Long commentID);
		
}