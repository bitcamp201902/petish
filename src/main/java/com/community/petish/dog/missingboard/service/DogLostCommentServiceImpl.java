package com.community.petish.dog.missingboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.dog.missingboard.dto.CommentCriteria;
import com.community.petish.dog.missingboard.dto.DogLostCommentRequestDTO;
import com.community.petish.dog.missingboard.dto.DogLostCommentResponseDTO;
import com.community.petish.dog.missingboard.mapper.DogLostCommentMapper;

@Service("dogLostCommentService")
public class DogLostCommentServiceImpl implements DogLostCommentService{
	
	@Autowired
	private DogLostCommentMapper dogLostCommentMapper;

	@Override
	//댓글 입력
	public int insertComment(DogLostCommentRequestDTO requestDTO) {
		
		int res = dogLostCommentMapper.insertComment(requestDTO);
		
		int commentCount = dogLostCommentMapper.getCommentCount(requestDTO.getPost_id());
		
		return res;
	}

	@Override
	//댓글 조회
	public DogLostCommentResponseDTO getComment(Long commentID) {
		DogLostCommentResponseDTO dto = dogLostCommentMapper.getComment(commentID);
		return dto;
	}

	@Override
	//댓글 리스트 조회
	public List<DogLostCommentResponseDTO> getCommentList(CommentCriteria cri, Long postID) {
		List<DogLostCommentResponseDTO> list = dogLostCommentMapper.getCommentList(cri, postID);
		return list;
	}
	
	@Override
	//댓글 갯수 조회
	public int getCommentCnt(Long postID) {
		int commentCnt = dogLostCommentMapper.getCommentCount(postID);
		return commentCnt;
	}

	@Override
	//댓글 수정
	public int modifyComment(DogLostCommentRequestDTO dto) {
		int res = dogLostCommentMapper.modifyComment(dto);
		return res;
	}

	@Override
	//댓글 삭제
	public int removeCommet(Long commentID) {
		int res = dogLostCommentMapper.removeComment(commentID);
		return res;
	}
}
