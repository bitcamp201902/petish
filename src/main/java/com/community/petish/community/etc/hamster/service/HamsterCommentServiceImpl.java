package com.community.petish.community.etc.hamster.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.community.etc.hamster.dto.CommentCriteria;
import com.community.petish.community.etc.hamster.dto.HamsterCommentRequestDTO;
import com.community.petish.community.etc.hamster.dto.HamsterCommentResponseDTO;
import com.community.petish.community.etc.hamster.mapper.HamsterCommentMapper;

@Service("hamsterCommentService")
public class HamsterCommentServiceImpl implements HamsterCommentService{
	
	@Autowired
	private HamsterCommentMapper hamsterCommentMapper;

	@Override
	//댓글 입력
	public int insertComment(HamsterCommentRequestDTO requestDTO) {
		
		int res = hamsterCommentMapper.insertComment(requestDTO);
		
		int commentCount = hamsterCommentMapper.getCommentCount(requestDTO.getPost_id());
		
		return res;
	}

	@Override
	//댓글 조회
	public HamsterCommentResponseDTO getComment(Long commentID) {
		HamsterCommentResponseDTO dto = hamsterCommentMapper.getComment(commentID);
		return dto;
	}

	@Override
	//댓글 리스트 조회
	public List<HamsterCommentResponseDTO> getCommentList(CommentCriteria cri) {
		List<HamsterCommentResponseDTO> list = hamsterCommentMapper.getCommentList(cri);
		return list;
	}
	
	@Override
	//댓글 갯수 조회
	public int getCommentCnt(Long postID) {
		int commentCnt = hamsterCommentMapper.getCommentCount(postID);
		return commentCnt;
	}

	@Override
	//댓글 수정
	public int modifyComment(HamsterCommentRequestDTO dto) {
		int res = hamsterCommentMapper.modifyComment(dto);
		return res;
	}

	@Override
	//댓글 삭제
	public int removeCommet(Long commentID) {
		int res = hamsterCommentMapper.removeComment(commentID);
		return res;
	}
}
