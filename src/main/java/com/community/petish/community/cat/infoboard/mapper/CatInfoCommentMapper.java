package com.community.petish.community.cat.infoboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.petish.community.cat.infoboard.domain.Criteria;
import com.community.petish.community.cat.infoboard.domain.CatInfoCommentDTO;
import com.community.petish.community.cat.infoboard.domain.CatInfoCommentVO;

public interface CatInfoCommentMapper {
	int insertComment(CatInfoCommentVO commentVO);
	CatInfoCommentVO getComment(Long commentID);
	List<CatInfoCommentDTO> getCommentList
		(@Param("cri") Criteria cri, 
		 @Param("POST_ID") Long postID);
	int modifyComment(CatInfoCommentVO commentVO);
	int removeComment(Long commentID);
	int getCommentCount(Long postID);
}
