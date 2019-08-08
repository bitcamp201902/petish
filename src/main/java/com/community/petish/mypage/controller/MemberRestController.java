package com.community.petish.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.mypage.dto.CommentedPageDTO;
import com.community.petish.mypage.dto.Criteria;
import com.community.petish.mypage.dto.LikedPageDTO;
import com.community.petish.mypage.dto.WritingPageDTO;
import com.community.petish.mypage.dto.Writings_LikedDTO;
import com.community.petish.mypage.service.DefaultService;
import com.community.petish.mypage.service.MessageService;
import com.community.petish.mypage.service.QuestionService;
import com.community.petish.mypage.service.UserService_Mypage;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/member/api/*")
public class MemberRestController {
	
	@Autowired
	private QuestionService questionServiceImpl;
	@Autowired
	private MessageService messageServiceImpl;
	@Autowired
	private UserService_Mypage userServiceImpl;
	@Autowired
	private DefaultService defaultServiceImpl;

	
		@GetMapping(value="/Writinglist/{member_id}/{page}",
				produces = {
						MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<WritingPageDTO> getWritingList(
					@PathVariable("member_id") Long member_id,
					@PathVariable("page") int page
					){
					log.info("Writinglist");
					log.info(member_id);
					Criteria cri = new Criteria(page,10, member_id);
					cri.setUser_id(member_id);
					return new ResponseEntity<>(defaultServiceImpl.getWritingListPaging(cri), HttpStatus.OK);
				}
		
		@GetMapping(value="/Commentedlist/{member_id}/{page}",
				produces = {
						MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<CommentedPageDTO> getCommentedList(
					@PathVariable("member_id") Long member_id,
					@PathVariable("page") int page
					){
					log.info("Commentedlist");
					Criteria cri = new Criteria(page,10, member_id);
					cri.setUser_id(member_id);
					return new ResponseEntity<>(defaultServiceImpl.getCommentedListPaging(cri), HttpStatus.OK);
				}

		@GetMapping(value="/Likedlist/{member_id}/{page}",
				produces = {
						MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<LikedPageDTO> getLikedList(
					@PathVariable("member_id") Long member_id,
					@PathVariable("page") int page
					){
					log.info("Likedlist");
					Criteria cri = new Criteria(page,10, member_id);
					cri.setUser_id(member_id);
					return new ResponseEntity<>(defaultServiceImpl.getLikedListPaging(cri), HttpStatus.OK);
				}
		
}
