package com.community.petish.community.dog.freeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.community.dog.freeboard.dto.Criteria;
import com.community.petish.community.dog.freeboard.dto.DogFreePostRequestDTO;
import com.community.petish.community.dog.freeboard.dto.DogFreePostResponseDTO;
import com.community.petish.community.dog.freeboard.mapper.DogFreeCommentMapper;
import com.community.petish.community.dog.freeboard.mapper.DogFreePostMapper;

@Service
public class DogFreePostServiceImpl implements DogFreePostService {
	
	@Autowired
	private DogFreePostMapper mapper;
	@Autowired
	private DogFreeCommentMapper commentMapper;
	
	// 게시글 수
	public int getPostCount(Criteria cri) {
		int count = mapper.getPostCount(cri);
		
		return count;
	}

	// 게시글 리스트
	public List<DogFreePostResponseDTO> getPostList(Criteria cri){
		
		System.out.println("[Service]Cri : " + cri);
		
		int commentCount = 0;
		List<DogFreePostResponseDTO> listDTO = mapper.getPostList(cri);
		
		for(int i=0; i<listDTO.size(); i++) {
			DogFreePostResponseDTO dto = listDTO.get(i);
			commentCount = commentMapper.getCommentCount(dto.getId());
			dto.setCommentCount(commentCount);
		}		
		return listDTO;
	}
	
	// 게시글 조회
	public DogFreePostResponseDTO getPostDetail(Long id) {
		
		DogFreePostResponseDTO dto = mapper.getPostDetail(id);
		System.out.println("[Service]" + dto);
		
		return dto;
	}

	// 게시글 조회 수 갱신
	public int updateViewCount(Long id) {
		int count = mapper.updateViewCount(id);
		
		return count;
	}
		
	// 게시글 작성
	public int register(DogFreePostRequestDTO dto) {
		int result = mapper.insertPost(dto);
		
		return result;
	}

	// 게시글 수정
	public int modify(DogFreePostRequestDTO dto) {
		int result = mapper.updatePost(dto);
		
		return result;
	}

	// 게시글 삭제
	public int delete(Long id) {
		int result = mapper.deletePost(id);
		
		return result;
	}
}
