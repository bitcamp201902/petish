package com.community.petish.community.dog.missingboard.mapper;

import java.util.List;

import com.community.petish.community.dog.missingboard.domain.TestVO;

public interface TestMapper {
	
	//게시글 수
	int getCount();
	
	//게시글 리스트
	List<TestVO> getPostList();
	
	//게시글 조회
	TestVO getPostDetail(int num);
	
	//게시글  작성
	int insertTest(TestVO vo);
	
	//게시글 수정
	int updateTest(TestVO vo);
	
	//게시글 삭제
	int deleteTest(int num);
	
}
