package com.community.petish.community.dog.freeboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.petish.community.dog.freeboard.dto.CommentCriteria;
import com.community.petish.community.dog.freeboard.dto.DogFreeCommentRequestDTO;
import com.community.petish.community.dog.freeboard.dto.DogFreeCommentResponseDTO;


public interface DogFreeCommentMapper {	
	//댓글 입력
	int insertComment(DogFreeCommentRequestDTO requestDTO);
	
	//댓글 조회
	DogFreeCommentResponseDTO getComment(Long commentID);
	
	//댓글 리스트 조회
	List<DogFreeCommentResponseDTO> getCommentList(@Param("cri") CommentCriteria cri);
	
	//댓글 수 조회
	int getCommentCount(Long postID);
	
	//댓글 수정
	int modifyComment(DogFreeCommentRequestDTO requestDTO);
	
	//댓글 삭제
	int removeComment(Long commentID);
		
}