package com.community.petish.community.dog.missingboard.mapper;

import java.util.List;

import com.community.petish.community.dog.missingboard.domain.AttachFileVO;

public interface AttachFileMapper {
	
	public void insert(AttachFileVO vo);
	
	public void delete(String uuid);
	
	public List<AttachFileVO> findByPostId(Long postId);
	
	public void deleteAll(Long postId);
	
}
