package com.community.petish.mypage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.mypage.dto.response.CommentedPageDTO;
import com.community.petish.mypage.dto.response.Criteria;
import com.community.petish.mypage.dto.response.LikedPageDTO;
import com.community.petish.mypage.dto.response.MyWritingsDTO;
import com.community.petish.mypage.dto.response.WritingPageDTO;
import com.community.petish.mypage.dto.response.Writings_CommentedDTO;
import com.community.petish.mypage.dto.response.Writings_LikedDTO;
import com.community.petish.mypage.mapper.DefaultMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class DefaultServiceImpl implements DefaultService{

	@Autowired
	DefaultMapper mapper;
	

	@Override
	public WritingPageDTO getWritingListPaging(Criteria cri) {
		log.info("내가쓴글갯수"+mapper.getWritingsCnt(cri.getUser_id()));
		log.info(cri);
		return new WritingPageDTO(
				mapper.getWritingsCnt(cri.getUser_id()),		
				mapper.getMyWritingsWithPaging(cri));
	}
	
	
	@Override
	public CommentedPageDTO getCommentedListPaging(Criteria cri) {
		log.info("내가댓글쓴글갯수"+mapper.getCommentedCnt(cri.getUser_id()));
		return new CommentedPageDTO(
				mapper.getCommentedCnt(cri.getUser_id()),
				mapper.getCommentedWithPaging(cri));
	}
	
	
	@Override
	public LikedPageDTO getLikedListPaging(Criteria cri) {
		log.info("내가쓴글갯수"+mapper.getLikedCnt(cri.getUser_id()));
		return new LikedPageDTO(
				mapper.getLikedCnt(cri.getUser_id()),
				mapper.getLikedWithPaging(cri));
	}
	
}
