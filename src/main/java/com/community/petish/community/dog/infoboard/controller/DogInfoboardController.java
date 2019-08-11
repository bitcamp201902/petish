package com.community.petish.community.dog.infoboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dog/infoboard/*")
public class DogInfoboardController {
	
	@RequestMapping("/list")
	public String dogInfoboardList() {
		return "/petish/dog/infoboard/list";
	}
	
	@RequestMapping("/detail")
	public String dogInfoboardDetail() {
		return "/petish/dog/infoboard/detail";
	}
	
	@RequestMapping("/writeForm")
	public String dogInfoboardWriteForm() {
		return "/petish/dog/infoboard/write_form";
	}
	
	@RequestMapping("/modifyForm")
	public String dogInfoboardModifyForm() {
		return "/petish/dog/infoboard/modify_form";
	}

}
