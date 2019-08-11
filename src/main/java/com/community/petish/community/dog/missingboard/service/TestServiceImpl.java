package com.community.petish.community.dog.missingboard.service;

import java.util.List;

import com.community.petish.community.dog.missingboard.domain.TestVO;
import com.community.petish.community.dog.missingboard.mapper.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor

public class TestServiceImpl implements TestService {
	
	@Autowired
	private TestMapper mapper;
	
		//게시글 수
		@Override
		public int getPostCount() {
			return mapper.getCount();
		};
		
		//게시글 리스트
		@Override
		public List<TestVO> getPostList(){
			return mapper.getPostList();
		}
		
		//게시글 조회
		@Override
		public TestVO getPostDetail(int num) {
			return mapper.getPostDetail(num);
		}
		
		//게시글  작성
		@Override
		public int insertTest(TestVO vo) {
			return mapper.insertTest(vo);
		}
		
		//게시글 수정
		@Override
		public int updateTest(TestVO vo) {
			return mapper.updateTest(vo);
		}
		
		//게시글 삭제
		@Override
		public int deleteTest(int num) {
			return mapper.deleteTest(num);
		}
		
}
