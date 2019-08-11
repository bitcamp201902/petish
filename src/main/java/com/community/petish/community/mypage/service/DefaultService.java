package com.community.petish.community.mypage.service;

import java.util.ArrayList;

import com.community.petish.community.mypage.dto.response.CommentedPageDTO;
import com.community.petish.community.mypage.dto.response.Criteria;
import com.community.petish.community.mypage.dto.response.LikedPageDTO;
import com.community.petish.community.mypage.dto.response.WritingPageDTO;

public interface DefaultService {

	WritingPageDTO getWritingListPaging(Criteria cri);

	CommentedPageDTO getCommentedListPaging(Criteria cri);
	
	LikedPageDTO getLikedListPaging(Criteria cri);

}
