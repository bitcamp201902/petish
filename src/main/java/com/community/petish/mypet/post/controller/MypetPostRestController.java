package com.community.petish.mypet.post.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.community.petish.mypet.post.dto.response.MypetPostDetailResponse;
import com.community.petish.mypet.post.service.MypetPostService;

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
	
	@GetMapping(value="/{postId}", produces= { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public MypetPostDetailResponse getPost(@PathVariable("postId") Long postId) {
		log.info("mypet post 요청 postId = {}", postId);
		
		MypetPostDetailResponse mypetPostDetailResponse = mypetPostService.getPost(postId);
		
		return mypetPostDetailResponse;
		
	}
	
	@GetMapping(value="/like/{postId}", produces= { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public Boolean getLikePressedByPostId(@PathVariable("postId") Long postId, HttpSession session) {
		log.info("mypet post에 대하여 좋아요를 눌렀는지 확인, postId = {}", postId);
		Boolean isPressed = mypetPostService.getIsLikePressedOnPost(postId, session);
		return isPressed;
	}
	
	@PostMapping(value="/like/{postId}")
	public void pressLike(@PathVariable("postId") Long postId, HttpSession session) {
		log.info("mypet post에 좋아요 요청 postId = {}", postId);
		mypetPostService.pressLikeOnPost(postId, session);
	}
	
}
