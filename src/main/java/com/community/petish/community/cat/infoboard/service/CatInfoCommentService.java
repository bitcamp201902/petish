package com.community.petish.community.cat.infoboard.service;

import java.util.List;

import com.community.petish.community.cat.infoboard.domain.Criteria;
import com.community.petish.community.cat.infoboard.domain.CatInfoCommentDTO;
import com.community.petish.community.cat.infoboard.domain.CatInfoCommentVO;

public interface CatInfoCommentService {
	public int insertComment(CatInfoCommentVO commentVO);
	public CatInfoCommentVO getComment(Long commentID);
	public List<CatInfoCommentDTO> getCommentList(Criteria cri, Long postID);
	public int modifyComment(CatInfoCommentVO commentVO);
	public int removeCommet(Long commentID);
	public int getCommentCnt(Long postID);
}
