package com.community.petish.community.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.petish.community.mypage.service.UserService_Mypage;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController_Mypage {
	
	@Autowired
	private UserService_Mypage userServiceMypage;
	
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
			model.addAttribute("member", userServiceMypage.findUser(member_id));
			return "petish/community/mypage/member_detail";
		}
	}
	

}
