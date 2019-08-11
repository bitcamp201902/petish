package com.community.petish.community.cat.missingboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cat/missingboard/*")
public class CatMissingboardController {

	@RequestMapping("/list")
	public String dogMissingBoardList() {
		return "petish/cat/missingboard/list";
	}
	
	@RequestMapping("/detail")
	public String dogMissingBoardDetail() {
		return "petish/cat/missingboard/detail";
	}
	
	@RequestMapping("/writeForm")
	public String dogMissingWriteForm() {
		return "petish/cat/missingboard/write_form";
	}
	
	@RequestMapping("/modifyForm")
	public String dogMissingModifyForm() {
		return "petish/cat/missingboard/modify_form";
	}
	
}
