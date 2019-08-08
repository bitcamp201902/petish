package com.community.petish.user.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.community.petish.mypage.service.DefaultService;
import com.community.petish.mypage.service.MessageService;
import com.community.petish.mypage.service.QuestionService;
import com.community.petish.mypage.service.UserService_Mypage;
import com.community.petish.user.dto.UserModifyPictureDTO_Mypage;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController_Mypage {
	
	@Autowired
	private QuestionService questionServiceImpl;
	
	@Autowired
	private MessageService messageServiceImpl;
	
	@Autowired
	private DefaultService defaultServiceImpl;
	
	@Autowired
	private UserService_Mypage userServiceImpl;
	
	@RequestMapping("/kakaomap")
	public String kakaomap() {
		return "commons/kakaomap";
	}
	
	@RequestMapping("/member/detail/{member_id}")
	public String memberDetail(@PathVariable("member_id") Long member_id, Model model, HttpSession session) {
		//로그인 여부 확인
		if(session.getAttribute("LOGIN_USER")==null) {
			return "petish/community/mypage/index";
		}else {
			model.addAttribute("member", userServiceImpl.findUser(member_id));
			return "petish/community/mypage/member_detail";
		}
	}
	

}
