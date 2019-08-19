package com.community.petish.community.cat.freeboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cat/freeboard/*")
public class CatFreeboardController {

	@RequestMapping("/list")
	public String dogFreeboardList() {
		return "petish/cat/freeboard/list";
	}
	
	@RequestMapping("/detail")
	public String dogFreeboardDetail() {
		return "petish/cat/freeboard/detail";
	}
	
	@RequestMapping("/writeForm")
	public String dogFreeboardWriteForm() {
		return "petish/cat/freeboard/write_form";
	}
	
	@RequestMapping("/modifyForm")
	public String dogFreeboardModifyForm() {
		return "petish/cat/freeboard/modify_form";
	}
	
}
