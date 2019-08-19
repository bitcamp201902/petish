package com.community.petish.community.mypage.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.community.petish.community.mypage.service.DefaultService;
import com.community.petish.community.mypage.service.MessageService;
import com.community.petish.community.mypage.service.QuestionService;
import com.community.petish.community.mypage.service.UserService_Mypage;
import com.community.petish.community.user.dto.response.LoginedUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.community.petish.community.mypage.dto.request.QuestionRequestDTO;
import com.community.petish.community.mypage.dto.request.UserModifyPictureDTO_Mypage;
import com.community.petish.community.mypage.dto.request.UserModifyRequestDTO_Mypage;
import com.community.petish.community.mypage.dto.response.Criteria;
import com.community.petish.community.mypage.dto.response.MessageResponseDTO;
import com.community.petish.community.mypage.dto.response.MyWritingsDTO;
import com.community.petish.community.mypage.dto.response.QuestionResponseDTO;
import com.community.petish.community.mypage.dto.response.UserResponseDTO_Mypage;
import com.community.petish.community.mypage.dto.response.Writings_CommentedDTO;
import com.community.petish.community.mypage.dto.response.Writings_LikedDTO;
import com.community.petish.community.mypage.service.DefaultService;
import com.community.petish.community.mypage.service.MessageService;
import com.community.petish.community.mypage.service.QuestionService;
import com.community.petish.community.mypage.service.UserService_Mypage;
import com.community.petish.community.user.dto.response.LoginedUser;

import com.community.petish.community.mypage.dto.request.QuestionRequestDTO;
import com.community.petish.community.mypage.dto.request.UserModifyPictureDTO_Mypage;
import com.community.petish.community.mypage.dto.request.UserModifyRequestDTO_Mypage;
import com.community.petish.community.mypage.dto.response.Criteria;
import com.community.petish.community.mypage.dto.response.QuestionResponseDTO;
import com.community.petish.community.mypage.dto.response.UserResponseDTO_Mypage;


import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private QuestionService questionServiceImpl;
	@Autowired
	private MessageService messageServiceImpl;
	@Autowired
	private DefaultService defaultServiceImpl;
	@Autowired
	private UserService_Mypage userServiceImpl;
	@Autowired
	PasswordEncoder passwordEncoder;

	@RequestMapping("/")
	public String mypage(Model model, HttpSession session, Criteria cri) {
		LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
		log.info(user.getId());
		UserResponseDTO_Mypage userResponse = userServiceImpl.findUser(user.getId());
		model.addAttribute("user", userResponse);
		return "petish/community/mypage/default";
	}

	
	@RequestMapping(value = "/modifyform/{user_id}")
	public String modifyform(@PathVariable("user_id") Long user_id, Model model, HttpSession session) {
			UserResponseDTO_Mypage dto = userServiceImpl.findUser(user_id);
			model.addAttribute("dto", dto);
			return "petish/community/mypage/info_modify_form";
	}
	
	
	@RequestMapping(value = "/modifyUserInfo", method = { RequestMethod.POST })
	public String modifyUserInfo(UserModifyRequestDTO_Mypage dto, Model model) {
		log.info("수정" + dto);
		if ((dto.getPassword().equals(""))) {
			userServiceImpl.modifyUserInfo(dto);
			log.info("비밀번호제외");
		} else {
			String encodedPassword = passwordEncoder.encode(dto.getPassword());
			dto.setPassword(encodedPassword);
			userServiceImpl.modifyUserInfoAll(dto);
			log.info("비밀번호포함");
		}
		return "redirect:./";
	}

	
	@PostMapping("/uploadFormAction")
	   public String uploadFormPost(MultipartFile[] uploadFile, HttpServletRequest request, UserModifyPictureDTO_Mypage dto) {

	      String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/mypage");
	      for (MultipartFile multipartFile : uploadFile) {

	         log.info("-------------------------------------");
	         log.info("Upload File Name: " + multipartFile.getOriginalFilename());
	         log.info("Upload File Size: " + multipartFile.getSize());

	         File saveFile = new File(uploadPath, multipartFile.getOriginalFilename());
	         dto.setPicture("/resources/img/mypage/"+multipartFile.getOriginalFilename());
	         log.info(dto.getPicture());
	         userServiceImpl.modifyPicture(dto);
	         
	         try {
	            multipartFile.transferTo(saveFile);
	         } catch (Exception e) {
	            
	            log.error(e.getMessage());
	         } 
	      }
	      
	      return "redirect:./modifyform/"+dto.getId();
	   }

	
	@RequestMapping("/question/list")
	public String questionList(Criteria cri, Model model, HttpSession session) {
			LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
			ArrayList<QuestionResponseDTO> list = questionServiceImpl.getQuestionList(user.getId());
			model.addAttribute("list", list);
			int amount = questionServiceImpl.getUndeleted(user.getId());
			model.addAttribute("amount", amount);
			return "petish/community/mypage/question_list";
	}
	
	@RequestMapping("/question/insert")
	public String insertQuestion(QuestionRequestDTO dto, HttpSession session) {
		QuestionRequestDTO questionRequestDTO = new QuestionRequestDTO();
		questionRequestDTO.setUser_id(dto.getUser_id());
		questionRequestDTO.setTitle(dto.getTitle());
		questionRequestDTO.setContent(dto.getContent());
		questionRequestDTO.setCategory_id(dto.getCategory_id());

		questionServiceImpl.insertQuestion(questionRequestDTO);

		return "redirect:./list";
	}
	
	@RequestMapping("/question/delete")
	public String deleteQuestion(Long id) {
		questionServiceImpl.deleteQuestion(id);
		return "redirect:./list";
	}


	@RequestMapping("/message/list")
	public String messageList(Model model, HttpSession session) {
			return "petish/community/mypage/message_list";
	}
	
	
	@RequestMapping("/message/delete")
	public String messageDelete(Long id) {
		messageServiceImpl.deleteMessage(id);
		return "redirect:./list";
	}
	
}
