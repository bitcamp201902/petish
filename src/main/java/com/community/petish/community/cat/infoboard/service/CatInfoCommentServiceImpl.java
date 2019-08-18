package com.community.petish.community.cat.infoboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.community.cat.infoboard.domain.Criteria;
import com.community.petish.community.cat.infoboard.domain.CatInfoCommentDTO;
import com.community.petish.community.cat.infoboard.domain.CatInfoCommentVO;
import com.community.petish.community.cat.infoboard.mapper.CatInfoCommentMapper;

@Service("catInfoCommentService")
public class CatInfoCommentServiceImpl implements CatInfoCommentService{
	
	@Autowired
	private CatInfoCommentMapper catInfoCommentMapper;

	@Override
	public int insertComment(CatInfoCommentVO commentVO) {
		int res = catInfoCommentMapper.insertComment(commentVO);
		return res;
	}

	@Override
	public CatInfoCommentVO getComment(Long commentID) {
		CatInfoCommentVO vo = catInfoCommentMapper.getComment(commentID);
		return vo;
	}

	@Override
	public List<CatInfoCommentDTO> getCommentList(Criteria cri, Long postID) {
		List<CatInfoCommentDTO> list = catInfoCommentMapper.getCommentList(cri, postID);
		return list;
	}

	@Override
	public int modifyComment(CatInfoCommentVO commentVO) {
		int res = catInfoCommentMapper.modifyComment(commentVO);
		return res;
	}
	
	@Override
	public int getCommentCnt(Long postID) {
		int commentCnt = catInfoCommentMapper.getCommentCount(postID);
		return commentCnt;
	}

	@Override
	public int removeCommet(Long commentID) {
		int res = catInfoCommentMapper.removeComment(commentID);
		return res;
	}


}
