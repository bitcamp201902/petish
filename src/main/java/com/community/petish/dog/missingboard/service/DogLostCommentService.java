package com.community.petish.dog.missingboard.service;

import java.util.List;

import com.community.petish.dog.missingboard.dto.CommentCriteria;
import com.community.petish.dog.missingboard.dto.DogLostCommentRequestDTO;
import com.community.petish.dog.missingboard.dto.DogLostCommentResponseDTO;

public interface DogLostCommentService {	
	//댓글 입력
	public int insertComment(DogLostCommentRequestDTO requestDTO);
	//댓글 조회
	public DogLostCommentResponseDTO getComment(Long commentID);
	//댓글 리스트 조회
	public List<DogLostCommentResponseDTO> getCommentList(CommentCriteria cri, Long postID);
	//댓글 갯수 조회
	public int getCommentCnt(Long postID);
	//댓글 수정
	public int modifyComment(DogLostCommentRequestDTO requestDTO);
	//댓글 삭제
	public int removeCommet(Long commentID);
}
