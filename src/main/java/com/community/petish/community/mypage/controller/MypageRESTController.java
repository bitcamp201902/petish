package com.community.petish.community.mypage.controller;

import javax.servlet.http.HttpSession;

import com.community.petish.community.mypage.service.DefaultService;
import com.community.petish.community.mypage.service.MessageService;
import com.community.petish.community.mypage.service.QuestionService;
import com.community.petish.community.mypage.service.UserService_Mypage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.community.mypage.dto.request.MessageRequestDTO;
import com.community.petish.community.mypage.dto.request.UserModifyPictureDTO_Mypage;
import com.community.petish.community.mypage.dto.response.CommentedPageDTO;
import com.community.petish.community.mypage.dto.response.Criteria;
import com.community.petish.community.mypage.dto.response.LikedPageDTO;
import com.community.petish.community.mypage.dto.response.MessageResponseDTO;
import com.community.petish.community.mypage.dto.response.MyWritingsDTO;
import com.community.petish.community.mypage.dto.response.QuestionPageDTO;
import com.community.petish.community.mypage.dto.response.ReceivedMessagePageDTO;
import com.community.petish.community.mypage.dto.response.SentMessagePageDTO;
import com.community.petish.community.mypage.dto.response.WritingPageDTO;
import com.community.petish.community.mypage.dto.response.Writings_CommentedDTO;
import com.community.petish.community.mypage.dto.response.Writings_LikedDTO;
import com.community.petish.community.mypage.service.DefaultService;
import com.community.petish.community.mypage.service.MessageService;
import com.community.petish.community.mypage.service.QuestionService;
import com.community.petish.community.mypage.service.QuestionServiceImpl;
import com.community.petish.community.mypage.service.UserService_Mypage;
import com.community.petish.community.user.dto.response.LoginedUser;

import com.community.petish.community.mypage.dto.request.MessageRequestDTO;
import com.community.petish.community.mypage.dto.response.CommentedPageDTO;
import com.community.petish.community.mypage.dto.response.Criteria;
import com.community.petish.community.mypage.dto.response.LikedPageDTO;
import com.community.petish.community.mypage.dto.response.MessageResponseDTO;
import com.community.petish.community.mypage.dto.response.QuestionPageDTO;
import com.community.petish.community.mypage.dto.response.ReceivedMessagePageDTO;
import com.community.petish.community.mypage.dto.response.SentMessagePageDTO;
import com.community.petish.community.mypage.dto.response.WritingPageDTO;
import com.community.petish.community.user.dto.response.LoginedUser;


import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/mypage/api/*")
public class MypageRESTController {
	
	@Autowired
	private QuestionService questionServiceImpl;
	@Autowired
	private MessageService messageServiceImpl;
	@Autowired
	private UserService_Mypage userServiceImpl;
	@Autowired
	private DefaultService defaultServiceImpl;
	
	@GetMapping(value="message/receivedList/{page}/{type}/{keyword}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReceivedMessagePageDTO> getReceivedListWithSearch(
				@PathVariable("page") int page,
				@PathVariable("type") String type,
				@PathVariable("keyword") String keyword,
				HttpSession session){
				log.info("receivedList");
				LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
				Criteria cri = new Criteria(page,10, user.getId());
				cri.setType(type);
				cri.setKeyword(keyword);
				log.info(page+"/"+type+"/"+keyword);
				return new ResponseEntity<>(messageServiceImpl.getReceivedMessagePaging(cri), HttpStatus.OK);
			}
	
	@GetMapping(value="message/receivedList/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReceivedMessagePageDTO> getReceivedList(
				@PathVariable("page") int page,
				HttpSession session){
				log.info("receivedList");
				LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
				Criteria cri = new Criteria(page,10, user.getId());
				log.info(page+"/");
				return new ResponseEntity<>(messageServiceImpl.getReceivedMessagePaging(cri), HttpStatus.OK);
			}
	
	@GetMapping(value="message/sentList/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<SentMessagePageDTO> getSentList(
			@PathVariable("page") int page,
			HttpSession session){
			log.info("sentList");
			LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
			Criteria cri = new Criteria(page,10, user.getId());
			log.info("보낸메세지리스트 page = {}"+ page);
			return new ResponseEntity<>(messageServiceImpl.getSentMessagePaging(cri), HttpStatus.OK);
			}

	@GetMapping(value="message/sentList/{page}/{type}/{keyword}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<SentMessagePageDTO> getSentListWithSearch(
			@PathVariable("page") int page,
			@PathVariable("type") String type,
			@PathVariable("keyword") String keyword,
			HttpSession session){
			log.info("sentList");
			LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
			Criteria cri = new Criteria(page,10, user.getId());
			cri.setType(type);
			cri.setKeyword(keyword);
			log.info(page+"/"+type+"/"+keyword);
			return new ResponseEntity<>(messageServiceImpl.getSentMessagePaging(cri), HttpStatus.OK);
			}
	
	@GetMapping(value = "/message/received/{id}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<MessageResponseDTO> receivedMessageDetail(@PathVariable("id") Long id) {
		return new ResponseEntity<MessageResponseDTO>(messageServiceImpl.receivedMessageDetail(id), HttpStatus.OK);
			}

	@GetMapping(value = "/message/sent/{id}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<MessageResponseDTO> sentMessageDetail(@PathVariable("id") Long id) {
		return new ResponseEntity<MessageResponseDTO>(messageServiceImpl.sentMessageDetail(id), HttpStatus.OK);
			}

	@DeleteMapping(value = "/message/{id}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> delete(@PathVariable("id") Long id) {
		log.info("delete");
		return messageServiceImpl.deleteMessage(id) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}

	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/message/{id}/{receiver_id}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> changeReadAttr(MessageRequestDTO dto, @PathVariable("id") Long id,
                                               @PathVariable("receiver_id") Long receiver_id) {
		dto.setId(id);
		dto.setReceiver_id(receiver_id);
		return messageServiceImpl.changeReadAttr(dto) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}

	@PostMapping(value = "/message/new",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody MessageRequestDTO dto){
		log.info("Message DTO :"+dto);
		int insertCount = messageServiceImpl.writeMessage(dto);
		log.info("insert count : "+insertCount);
		return insertCount == 1
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
			}
	
	@GetMapping(value="/Writinglist/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<WritingPageDTO> getWritingList(
				@PathVariable("page") int page,
				HttpSession session){
				log.info("Writinglist");
				log.info("page"+page);
				LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
				Criteria cri = new Criteria(page, 10, user.getId());
				log.info("내가쓴글페이지"+page);
				return new ResponseEntity<>(defaultServiceImpl.getWritingListPaging(cri), HttpStatus.OK);
			}
	
	@GetMapping(value="/Commentedlist/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<CommentedPageDTO> getCommentedList(
			@PathVariable("page") int page,
			HttpSession session){
				log.info("Commentedlist");
				LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
				Criteria cri = new Criteria(page,10, user.getId());
				return new ResponseEntity<>(defaultServiceImpl.getCommentedListPaging(cri), HttpStatus.OK);
			}
	
	@GetMapping(value="/Likedlist/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<LikedPageDTO> getLikedList(
			@PathVariable("page") int page,
			HttpSession session){
				log.info("Likedlist");
				LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
				Criteria cri = new Criteria(page,10, user.getId());
				return new ResponseEntity<>(defaultServiceImpl.getLikedListPaging(cri), HttpStatus.OK);
			}


	@GetMapping(value="/questionList/{page}",
			produces = {
				MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<QuestionPageDTO> getQuestionList(
					@PathVariable("page") int page,
					HttpSession session){
						log.info("questionList");
						LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
						Criteria cri = new Criteria(page,10, user.getId());
						return new ResponseEntity<>(questionServiceImpl.getQuestionListPaging(cri), HttpStatus.OK);
			}
	
	
}
