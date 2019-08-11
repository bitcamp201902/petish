package com.community.petish.community.mypet.post.service;

import javax.servlet.http.HttpSession;

import com.community.petish.community.mypet.post.dto.request.MypetPostListCriteria;
import com.community.petish.community.mypet.post.dto.response.MypetPostDetailResponse;
import com.community.petish.community.mypet.post.dto.response.MypetPostLikeListResponse;
import com.community.petish.community.mypet.post.dto.response.MypetPostSummaryList;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MypetPostService {

	Long savePost(MultipartHttpServletRequest request) throws Exception;
	
	MypetPostSummaryList getPosts(MypetPostListCriteria mypetPostListCriteria);
	
	MypetPostDetailResponse getPost(Long postId);
	
	Boolean getIsLikePressedOnPost(Long postId, HttpSession session);
	
	MypetPostLikeListResponse getLikes(Long postId);
	
	Long pressLikeOnPost(Long postId, HttpSession session);
	
}
