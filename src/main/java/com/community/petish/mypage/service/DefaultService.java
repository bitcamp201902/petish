package com.community.petish.mypage.service;

import java.util.ArrayList;

import com.community.petish.mypage.dto.CommentedPageDTO;
import com.community.petish.mypage.dto.Criteria;
import com.community.petish.mypage.dto.LikedPageDTO;
import com.community.petish.mypage.dto.MyWritingsDTO;
import com.community.petish.mypage.dto.WritingPageDTO;
import com.community.petish.mypage.dto.Writings_CommentedDTO;
import com.community.petish.mypage.dto.Writings_LikedDTO;

public interface DefaultService {

	public WritingPageDTO getWritingListPaging(Criteria cri);

	public CommentedPageDTO getCommentedListPaging(Criteria cri);
	
	public LikedPageDTO getLikedListPaging(Criteria cri);

}
