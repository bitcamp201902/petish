package com.community.petish.mypage.service;

import java.util.ArrayList;

import com.community.petish.mypage.dto.response.CommentedPageDTO;
import com.community.petish.mypage.dto.response.Criteria;
import com.community.petish.mypage.dto.response.LikedPageDTO;
import com.community.petish.mypage.dto.response.MyWritingsDTO;
import com.community.petish.mypage.dto.response.WritingPageDTO;
import com.community.petish.mypage.dto.response.Writings_CommentedDTO;
import com.community.petish.mypage.dto.response.Writings_LikedDTO;

public interface DefaultService {

	public WritingPageDTO getWritingListPaging(Criteria cri);

	public CommentedPageDTO getCommentedListPaging(Criteria cri);
	
	public LikedPageDTO getLikedListPaging(Criteria cri);

}
