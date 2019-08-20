package com.community.petish.community.etc.hamster.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.petish.community.etc.hamster.dto.CommentCriteria;
import com.community.petish.community.etc.hamster.dto.HamsterCommentRequestDTO;
import com.community.petish.community.etc.hamster.dto.HamsterCommentResponseDTO;

public interface HamsterCommentMapper {	
	//댓글 입력
	int insertComment(HamsterCommentRequestDTO requestDTO);
	
	//댓글 조회
	HamsterCommentResponseDTO getComment(Long commentID);
	
	//댓글 리스트 조회
	List<HamsterCommentResponseDTO> getCommentList(@Param("cri") CommentCriteria cri);
	
	//댓글 수 조회
	int getCommentCount(Long postID);
	
	//댓글 수정
	int modifyComment(HamsterCommentRequestDTO requestDTO);
	
	//댓글 삭제
	int removeComment(Long commentID);
		
}