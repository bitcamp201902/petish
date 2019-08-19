package com.community.petish.community.dog.freeboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dog/freeboard/*")
public class DogFreeboardController {

	@RequestMapping("/list")
	public String dogFreeboardList() {
		return "petish/dog/freeboard/list";
	}
	
	@RequestMapping("/detail")
	public String dogFreeboardDetail() {
		return "petish/dog/freeboard/detail";
	}
	
	@RequestMapping("/writeForm")
	public String dogFreeboardWriteForm() {
		return "petish/dog/freeboard/write_form";
	}
	
	@RequestMapping("/modifyForm")
	public String dogFreeboardModifyForm() {
		return "petish/dog/freeboard/modify_form";
	}
	
}
