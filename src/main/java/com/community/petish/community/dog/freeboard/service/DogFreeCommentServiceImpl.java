package com.community.petish.community.dog.freeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.community.dog.freeboard.dto.CommentCriteria;
import com.community.petish.community.dog.freeboard.dto.DogFreeCommentRequestDTO;
import com.community.petish.community.dog.freeboard.dto.DogFreeCommentResponseDTO;
import com.community.petish.community.dog.freeboard.mapper.DogFreeCommentMapper;

@Service
public class DogFreeCommentServiceImpl implements DogFreeCommentService{
	
	@Autowired
	private DogFreeCommentMapper commentMapper;

	@Override
	//댓글 입력
	public int insertComment(DogFreeCommentRequestDTO requestDTO) {
		
		int res = commentMapper.insertComment(requestDTO);
		
		int commentCount = commentMapper.getCommentCount(requestDTO.getPost_id());
		
		return res;
	}

	@Override
	//댓글 조회
	public DogFreeCommentResponseDTO getComment(Long commentID) {
		DogFreeCommentResponseDTO dto = commentMapper.getComment(commentID);
		return dto;
	}

	@Override
	//댓글 리스트 조회
	public List<DogFreeCommentResponseDTO> getCommentList(CommentCriteria cri) {
		List<DogFreeCommentResponseDTO> list = commentMapper.getCommentList(cri);
		return list;
	}
	
	@Override
	//댓글 갯수 조회
	public int getCommentCnt(Long postID) {
		int commentCnt = commentMapper.getCommentCount(postID);
		return commentCnt;
	}

	@Override
	//댓글 수정
	public int modifyComment(DogFreeCommentRequestDTO dto) {
		int res = commentMapper.modifyComment(dto);
		return res;
	}

	@Override
	//댓글 삭제
	public int removeCommet(Long commentID) {
		int res = commentMapper.removeComment(commentID);
		return res;
	}
}
