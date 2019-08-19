package com.community.petish.community.mypet.post.controller;

import javax.servlet.http.HttpSession;

import com.community.petish.community.mypet.post.dto.request.MypetPostListCriteria;
import com.community.petish.community.mypet.post.dto.response.MypetPostDetailResponse;
import com.community.petish.community.mypet.post.dto.response.MypetPostLikeListResponse;
import com.community.petish.community.mypet.post.dto.response.MypetPostSummaryList;
import com.community.petish.community.mypet.post.service.MypetPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/mypet/posts")
public class MypetPostRestController {
	
	@Autowired
  MypetPostService mypetPostService;
	
	@PostMapping
	public void savePost(MultipartHttpServletRequest request) throws Exception {
		log.info("mypet Post upload 요청");
		
		Long postId = mypetPostService.savePost(request);
		
	}
	
	@GetMapping(produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public MypetPostSummaryList getPosts(MypetPostListCriteria mypetPostListCriteria) {
		log.info("mypet post 조회 page = {}", mypetPostListCriteria);
		
		MypetPostSummaryList mypetPostSummaryList = mypetPostService.getPosts(mypetPostListCriteria);

		log.info("mypetPostSummaryList = {}", mypetPostSummaryList);
		
		return mypetPostSummaryList;
	}
	
	@GetMapping(value="/{postId}", produces= { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public MypetPostDetailResponse getPost(@PathVariable("postId") Long postId) {
		log.info("mypet post 요청 postId = {}", postId);
		
		MypetPostDetailResponse mypetPostDetailResponse = mypetPostService.getPost(postId);
		
		return mypetPostDetailResponse;
		
	}
	
	@GetMapping(value="/isLiked/{postId}", produces= { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public Boolean getLikePressedByPostId(@PathVariable("postId") Long postId, HttpSession session) {
		log.info("mypet post에 대하여 좋아요를 눌렀는지 확인, postId = {}", postId);
		Boolean isPressed = mypetPostService.getIsLikePressedOnPost(postId, session);
		return isPressed;
	}
	
	@GetMapping(value="/likes/{postId}", produces= { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public MypetPostLikeListResponse getLikes(@PathVariable("postId") Long postId) {
		log.info("mypet post에 대하여 좋아요 조회 postId = {}", postId);
		MypetPostLikeListResponse mypetPostLikeListResponse =  mypetPostService.getLikes(postId);
		return mypetPostLikeListResponse;
	}

	@PostMapping(value="/likes/{postId}")
	public void pressLike(@PathVariable("postId") Long postId, HttpSession session) {
		log.info("mypet post에 좋아요 요청 postId = {}", postId);
		mypetPostService.pressLikeOnPost(postId, session);
	}
	
}
