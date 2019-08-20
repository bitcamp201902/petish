package com.community.petish.community.dog.freeboard.service;

import java.util.List;

import com.community.petish.community.dog.freeboard.dto.CommentCriteria;
import com.community.petish.community.dog.freeboard.dto.DogFreeCommentRequestDTO;
import com.community.petish.community.dog.freeboard.dto.DogFreeCommentResponseDTO;

public interface DogFreeCommentService {	
	//댓글 입력
	public int insertComment(DogFreeCommentRequestDTO requestDTO);
	//댓글 조회
	public DogFreeCommentResponseDTO getComment(Long commentID);
	//댓글 리스트 조회
	public List<DogFreeCommentResponseDTO> getCommentList(CommentCriteria cri);
	//댓글 갯수 조회
	public int getCommentCnt(Long postID);
	//댓글 수정
	public int modifyComment(DogFreeCommentRequestDTO requestDTO);
	//댓글 삭제
	public int removeCommet(Long commentID);
}
