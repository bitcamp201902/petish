package com.community.petish.community.etc.hamster.service;

import java.util.List;

import com.community.petish.community.etc.hamster.dto.CommentCriteria;
import com.community.petish.community.etc.hamster.dto.HamsterCommentRequestDTO;
import com.community.petish.community.etc.hamster.dto.HamsterCommentResponseDTO;


public interface HamsterCommentService {	
	//댓글 입력
	public int insertComment(HamsterCommentRequestDTO requestDTO);
	//댓글 조회
	public HamsterCommentResponseDTO getComment(Long commentID);
	//댓글 리스트 조회
	public List<HamsterCommentResponseDTO> getCommentList(CommentCriteria cri);
	//댓글 갯수 조회
	public int getCommentCnt(Long postID);
	//댓글 수정
	public int modifyComment(HamsterCommentRequestDTO requestDTO);
	//댓글 삭제
	public int removeCommet(Long commentID);
}
