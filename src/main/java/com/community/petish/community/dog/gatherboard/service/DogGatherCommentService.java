package com.community.petish.community.dog.gatherboard.service;

import java.util.List;

import com.community.petish.community.dog.gatherboard.domain.Criteria;
import com.community.petish.community.dog.gatherboard.domain.DogGatherCommentVO;
import com.community.petish.community.dog.gatherboard.dto.response.DogGatherCommentDTO;

public interface DogGatherCommentService {
	public int insertComment(DogGatherCommentVO commentVO);
	public DogGatherCommentVO getComment(Long commentID);
	public List<DogGatherCommentDTO> getCommentList(Criteria cri, Long postID);
	public int modifyComment(DogGatherCommentVO commentVO);
	public int removeCommet(Long commentID);
	public int getCommentCnt(Long postID);
}
